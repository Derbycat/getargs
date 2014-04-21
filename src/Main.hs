module Main where
import           Control.Monad         (forM_)
import           System.Console.GetOpt
import           System.Environment
import           Opts

main :: IO ()
main = do

    -- Get and print info from the environment
    argsRaw <- getArgs
    pname <-getProgName
    putStrLn $ "Program name: " ++ show pname
    putStrLn "Program arguments (raw):"
    forM_ argsRaw $ \arg ->
        putStrLn $ "  " ++ arg
    putStrLn "Environment Variables:"
    envs <- getEnvironment
    forM_ envs $ \(var, val) ->
        putStrLn $ "  " ++ var ++ " = " ++ val
    
    -- Process the options/arguments
    (flags, arguments) <- processOpts argsRaw
    forM_ flags $ \flag ->
        putStrLn $ "  " ++ show flag
    putStrLn "Arguments:"
    forM_ arguments $ \arg ->
        putStrLn $ "  " ++ arg
    putStrLn "Good day!"