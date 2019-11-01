{-# LANGUAGE TypeApplications #-}
module Program where

import Program.Monadtastic

import Control.Monad
import Control.Effect
import Control.Effect.State
import Control.Effect.Reader
import Control.Effect.Writer

someProgram :: M ()
someProgram =
    do  b <- ask @Bool
        modify @Int (if b then (+2) else (*2))
        tell @[String] ["a log message"]

