{-# LANGUAGE QuasiQuotes, TemplateHaskell #-}
module InlineC where

import Internal
import Types

import Language.C.Inline as C

context ctx

C.include "<queue.h>"
