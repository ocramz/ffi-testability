{-# language GeneralizedNewtypeDeriving #-}
module Types where

import Data.Functor ((<$>))
import Control.Applicative ((<*>))

import Foreign.Storable
import Foreign.Ptr

import Data.Word (Word32)          -- uint32_t
import Foreign.C.Types (CSize(..)) -- size_t

-- | spec :

{-
typedef struct queue_s {
  uint32_t *elements;
  size_t size;
  uint32_t volatile *tail;
  uint32_t volatile *head;
} queue_t;
-}

newtype QuT = QuT (Ptr QuT) deriving (Storable)
  




-- | Utils

cSizeToInt :: CSize -> Int
cSizeToInt = fromIntegral



-- | hand-written Storable instance for queue_s


-- data QuT = QuT
--               {
--                 qElems :: Ptr Word32,
--                 qSize :: CSize,
--                 qTail :: Ptr Word32,
--                 qHead :: Ptr Word32
--               } deriving (Eq)

-- instance Storable QuT where
--   sizeOf _ = 3 * sizeOf (undefined :: Ptr Word32) + sizeOf (undefined :: CSize)
--   alignment _ = alignment (undefined :: Ptr Word32)
--   peek = error "peek not implemented for QuT"
--   poke _ _ = error "poke not implemented for QuT"
  

-- instance Storable QuT where
--   sizeOf x =
--     2 * sizeOf (undefined :: Word32) +
--     (cSizeToInt $ qSize x) * sizeOf (undefined :: Word32) 
