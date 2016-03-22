{-# language GeneralizedNewtypeDeriving #-}
module Types where

import Foreign.Storable
import Foreign.Ptr

import Data.Word (Word32)
import Foreign.C.Types (CSize(..))

-- typedef struct queue_s {
--   uint32_t *elements;
--   size_t size;
--   uint32_t volatile *tail;
--   uint32_t volatile *head;
-- } queue_t;

newtype QueueS = QueueS (Ptr QueueS) deriving (Storable)
  
  
