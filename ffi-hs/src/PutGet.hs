module PutGet where

import Types
import InlineC

import Data.Word (Word32)
import Foreign.C.Types (CSize(..))




queueInit buf sz = withPtr $ \q -> queueInit' q buf sz
