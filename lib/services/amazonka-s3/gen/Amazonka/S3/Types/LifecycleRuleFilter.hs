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
-- Module      : Amazonka.S3.Types.LifecycleRuleFilter
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.S3.Types.LifecycleRuleFilter where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import Amazonka.S3.Internal
import Amazonka.S3.Types.LifecycleRuleAndOperator
import Amazonka.S3.Types.Tag

-- | The @Filter@ is used to identify objects that a Lifecycle Rule applies
-- to. A @Filter@ must have exactly one of @Prefix@, @Tag@, or @And@
-- specified.
--
-- /See:/ 'newLifecycleRuleFilter' smart constructor.
data LifecycleRuleFilter = LifecycleRuleFilter'
  { -- | This tag must exist in the object\'s tag set in order for the rule to
    -- apply.
    tag :: Prelude.Maybe Tag,
    -- | Prefix identifying one or more objects to which the rule applies.
    --
    -- Replacement must be made for object keys containing special characters
    -- (such as carriage returns) when using XML requests. For more
    -- information, see
    -- <https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints XML related object key constraints>.
    prefix :: Prelude.Maybe Prelude.Text,
    and :: Prelude.Maybe LifecycleRuleAndOperator
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'LifecycleRuleFilter' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'tag', 'lifecycleRuleFilter_tag' - This tag must exist in the object\'s tag set in order for the rule to
-- apply.
--
-- 'prefix', 'lifecycleRuleFilter_prefix' - Prefix identifying one or more objects to which the rule applies.
--
-- Replacement must be made for object keys containing special characters
-- (such as carriage returns) when using XML requests. For more
-- information, see
-- <https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints XML related object key constraints>.
--
-- 'and', 'lifecycleRuleFilter_and' - Undocumented member.
newLifecycleRuleFilter ::
  LifecycleRuleFilter
newLifecycleRuleFilter =
  LifecycleRuleFilter'
    { tag = Prelude.Nothing,
      prefix = Prelude.Nothing,
      and = Prelude.Nothing
    }

-- | This tag must exist in the object\'s tag set in order for the rule to
-- apply.
lifecycleRuleFilter_tag :: Lens.Lens' LifecycleRuleFilter (Prelude.Maybe Tag)
lifecycleRuleFilter_tag = Lens.lens (\LifecycleRuleFilter' {tag} -> tag) (\s@LifecycleRuleFilter' {} a -> s {tag = a} :: LifecycleRuleFilter)

-- | Prefix identifying one or more objects to which the rule applies.
--
-- Replacement must be made for object keys containing special characters
-- (such as carriage returns) when using XML requests. For more
-- information, see
-- <https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints XML related object key constraints>.
lifecycleRuleFilter_prefix :: Lens.Lens' LifecycleRuleFilter (Prelude.Maybe Prelude.Text)
lifecycleRuleFilter_prefix = Lens.lens (\LifecycleRuleFilter' {prefix} -> prefix) (\s@LifecycleRuleFilter' {} a -> s {prefix = a} :: LifecycleRuleFilter)

-- | Undocumented member.
lifecycleRuleFilter_and :: Lens.Lens' LifecycleRuleFilter (Prelude.Maybe LifecycleRuleAndOperator)
lifecycleRuleFilter_and = Lens.lens (\LifecycleRuleFilter' {and} -> and) (\s@LifecycleRuleFilter' {} a -> s {and = a} :: LifecycleRuleFilter)

instance Core.FromXML LifecycleRuleFilter where
  parseXML x =
    LifecycleRuleFilter'
      Prelude.<$> (x Core..@? "Tag")
      Prelude.<*> (x Core..@? "Prefix")
      Prelude.<*> (x Core..@? "And")

instance Prelude.Hashable LifecycleRuleFilter where
  hashWithSalt _salt LifecycleRuleFilter' {..} =
    _salt `Prelude.hashWithSalt` tag
      `Prelude.hashWithSalt` prefix
      `Prelude.hashWithSalt` and

instance Prelude.NFData LifecycleRuleFilter where
  rnf LifecycleRuleFilter' {..} =
    Prelude.rnf tag
      `Prelude.seq` Prelude.rnf prefix
      `Prelude.seq` Prelude.rnf and

instance Core.ToXML LifecycleRuleFilter where
  toXML LifecycleRuleFilter' {..} =
    Prelude.mconcat
      [ "Tag" Core.@= tag,
        "Prefix" Core.@= prefix,
        "And" Core.@= and
      ]
