{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.S3.Types.Stats
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.S3.Types.Stats where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import Amazonka.S3.Internal

-- | Container for the stats details.
--
-- /See:/ 'newStats' smart constructor.
data Stats = Stats'
  { -- | The total number of bytes of records payload data returned.
    bytesReturned :: Prelude.Maybe Prelude.Integer,
    -- | The total number of object bytes scanned.
    bytesScanned :: Prelude.Maybe Prelude.Integer,
    -- | The total number of uncompressed object bytes processed.
    bytesProcessed :: Prelude.Maybe Prelude.Integer
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'Stats' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'bytesReturned', 'stats_bytesReturned' - The total number of bytes of records payload data returned.
--
-- 'bytesScanned', 'stats_bytesScanned' - The total number of object bytes scanned.
--
-- 'bytesProcessed', 'stats_bytesProcessed' - The total number of uncompressed object bytes processed.
newStats ::
  Stats
newStats =
  Stats'
    { bytesReturned = Prelude.Nothing,
      bytesScanned = Prelude.Nothing,
      bytesProcessed = Prelude.Nothing
    }

-- | The total number of bytes of records payload data returned.
stats_bytesReturned :: Lens.Lens' Stats (Prelude.Maybe Prelude.Integer)
stats_bytesReturned = Lens.lens (\Stats' {bytesReturned} -> bytesReturned) (\s@Stats' {} a -> s {bytesReturned = a} :: Stats)

-- | The total number of object bytes scanned.
stats_bytesScanned :: Lens.Lens' Stats (Prelude.Maybe Prelude.Integer)
stats_bytesScanned = Lens.lens (\Stats' {bytesScanned} -> bytesScanned) (\s@Stats' {} a -> s {bytesScanned = a} :: Stats)

-- | The total number of uncompressed object bytes processed.
stats_bytesProcessed :: Lens.Lens' Stats (Prelude.Maybe Prelude.Integer)
stats_bytesProcessed = Lens.lens (\Stats' {bytesProcessed} -> bytesProcessed) (\s@Stats' {} a -> s {bytesProcessed = a} :: Stats)

instance Core.FromXML Stats where
  parseXML x =
    Stats'
      Prelude.<$> (x Core..@? "BytesReturned")
      Prelude.<*> (x Core..@? "BytesScanned")
      Prelude.<*> (x Core..@? "BytesProcessed")

instance Prelude.Hashable Stats where
  hashWithSalt _salt Stats' {..} =
    _salt `Prelude.hashWithSalt` bytesReturned
      `Prelude.hashWithSalt` bytesScanned
      `Prelude.hashWithSalt` bytesProcessed

instance Prelude.NFData Stats where
  rnf Stats' {..} =
    Prelude.rnf bytesReturned
      `Prelude.seq` Prelude.rnf bytesScanned
      `Prelude.seq` Prelude.rnf bytesProcessed
