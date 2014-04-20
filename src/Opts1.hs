module Opts1 where
    
    import System.Console.GetOpt
    import Data.Maybe ( fromMaybe )
    
    data Flag
     = Verbose  | Version
     | Input String | Output String | LibDir String | Xyzzy String
       deriving Show
    
    options :: [OptDescr Flag]
    options =
     [ Option ['v']     ["verbose"] (NoArg Verbose)         "chatty output on stderr"
     , Option ['V','?'] ["version"] (NoArg Version)         "show version number"
     , Option ['o']     ["output"]  (OptArg outp "FILE")    "output FILE"
     , Option ['c']     ["input"]   (OptArg inp  "FILE")    "input FILE"
     , Option ['L']     ["libdir"]  (ReqArg LibDir "DIR")   "library directory"
     , Option ['x']     ["xyzzy"]   (OptArg xyz "42")       "magic number"
     ]
    
    inp, outp, xyz :: Maybe String -> Flag
    inp  = Input  . fromMaybe "stdin"
    outp = Output . fromMaybe "stdout"
    xyz  = Xyzzy  . fromMaybe "42"
    
    processOpts :: [String] -> IO ([Flag], [String])
    processOpts argv =
       case getOpt Permute options argv of
          (o,n,[]  ) -> return (o,n)
          (_,_,errs) -> ioError $ userError $ concat errs ++ usageInfo header options
      where header = "Usage: klwtest [OPTION...] files..."