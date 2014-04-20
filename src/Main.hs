-- | Main entry point to the application.
module Main where
import  System.Environment
import  Control.Monad   (forM_)

-- | The main entry point.
main :: IO ()
main = do
    putStrLn "Program name:"
    pname <-getProgName
    putStrLn pname
    putStrLn "Program arguments:"
    args <- getArgs
    forM_ args $ \arg ->
        putStrLn $ "  " ++ arg
    putStrLn "Environment Variables:"
    envs <- getEnvironment
    forM_ envs $ \(var, val) ->
        putStrLn $ "  " ++ var ++ " = " ++ val
    putStrLn "Good day!"
