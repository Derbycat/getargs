module Main where
import          Control.Monad         (forM_)
import          System.Console.GetOpt
import          System.Environment
import          Opts
import          Text.Printf


main :: IO ()
main = do

    -- Get and print info from the environment
    argsRaw <- getArgs
    pname <-getProgName
    printf "Program name: %s\n" pname
    printf "Program arguments (raw):\n"
    forM_ argsRaw $ \arg ->
        printf "  %s\n" arg
    printf "Environment Variables:"
    envs <- getEnvironment
    forM_ envs $ \(var, val) ->
        printf "  %s = %s\n" var val
    
    -- Process the options/arguments
    (flags, arguments) <- processOpts argsRaw
    forM_ flags $ \flag ->
        printf "  %s\n" (show flag)
    printf "Arguments:\n"
    forM_ arguments $ \arg ->
        printf "  %s\n" arg
    printf "Good day!\n"