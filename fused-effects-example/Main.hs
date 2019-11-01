module Main where

import Program (someProgram)
import Program.Monadtastic (runBoondogle)
    
main :: IO ()
main = print $ runBoondogle 0 False someProgram
