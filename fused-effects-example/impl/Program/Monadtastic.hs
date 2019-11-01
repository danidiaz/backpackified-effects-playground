{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Program.Monadtastic (Sig,M) where

import Control.Monad
import Control.Effect
import Control.Effect.State
import Control.Effect.Reader
import Control.Effect.Writer

type Sig = 
    State Int
    :+:
    Reader Bool
    :+:
    Writer [String]
    :+:
    Pure

type M = StateC Int 
       ( ReaderC Bool
       ( WriterC [String] 
         PureC ))

runBoondogle :: Int -> Bool -> M a -> ([String],a)
runBoondogle s env = 
      run
    . runWriter 
    . runReader env
    . evalState s
