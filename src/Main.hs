-- | Main entry point to the application.
module Main where
import  System.Environment
import  Control.Monad   (forM_)

-- | The main entry point.
main :: IO ()
main = do
    putStrLn "Welcome to FP Haskell Center!"
    pname <-getProgName
    args <- getArgs
    putStrLn pname
    forM_ args $ \arg ->
        putStrLn arg
    putStrLn "Have a good day!"
