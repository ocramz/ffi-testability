{-# LANGUAGE QuasiQuotes, TemplateHaskell #-}
module InlineC where

import Internal
import Types

import qualified Language.C.Inline as C

import Data.Word -- (Word32)          -- uint32_t
import Foreign.C.Types -- (CSize(..)) -- size_t

C.context ctx

C.include "<queue.h>"

-- queueInit' q_ buf sz =
--   [C.exp|void{queue_init($(QuT* q_), $(Word32* buf), $(CSize sz))}|]

queueInitDummy _q buf sz =
  [C.exp|void{queue_init($(void* _q), $(Word32* buf), $(CSize sz))}|]
