import Control.Concurrent
import Control.Concurrent.MVar
import System.IO

add' :: Int -> Int -> MVar Int -> IO ()
add' a b mVar = do
    putMVar mVar $! (a+b)

main1 :: IO ()
main1 = do
    mVar <- newEmptyMVar
    forkIO $ add' 1 2 mVar
    result <- takeMVar mVar
    putStrLn $ show result


greet :: IO String
greet = do
    tid <-myThreadId
    let greeting = "Hello "++ show tid
    return $! greeting

threadHello :: MVar () -> Chan () -> IO ()
threadHello mutex endFlags = do
    greeting <- greet
    takeMVar mutex
    putStrLn greeting
    putMVar mutex ()
    writeChan endFlags ()

main :: IO ()
main = do 
    hSetBuffering stdout NoBuffering
    let n  = 10
    mutex <- newEmptyMVar
    endFlags <- newChan
    mapM_ (const $ forkIO $ threadHello mutex endFlags) [1..n]
    putMVar mutex()
    mapM_ (\_ -> readChan endFlags) [1..n]