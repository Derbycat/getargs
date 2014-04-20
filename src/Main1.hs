module Main1 where
import           Control.Monad         (forM_)
import           System.Console.GetOpt
import           System.Environment
import           Opts1

main :: IO ()
main = do
    putStrLn "Hello"
    argsRaw <- getArgs
    (flags, arguments) <- processOpts argsRaw
    forM_ flags $ \flag ->
        putStrLn $ "  " ++ show flag
    putStrLn "Arguments:"
    forM_ arguments $ \arg ->
        putStrLn $ "  " ++ arg
    putStrLn "Good day!"