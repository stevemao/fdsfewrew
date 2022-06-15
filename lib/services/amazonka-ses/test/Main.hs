{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Main
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Main (main) where

import Test.Amazonka.SES
import Test.Amazonka.SES.Internal
import Test.Tasty

main :: IO ()
main =
  defaultMain $
    testGroup
      "SES"
      [ testGroup "tests" tests,
        testGroup "fixtures" fixtures
      ]
