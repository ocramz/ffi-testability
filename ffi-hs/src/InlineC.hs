{-# LANGUAGE QuasiQuotes, TemplateHaskell #-}
module InlineC where

import Internal
-- import Types

import Language.C.Inline as C

context ctx

C.include "<queue.h>"

queueInit' q_ buf sz =
  [C.exp|void{queue_init($(QuT* q_), $(Word32* buf), $(CSize sz))}|]
