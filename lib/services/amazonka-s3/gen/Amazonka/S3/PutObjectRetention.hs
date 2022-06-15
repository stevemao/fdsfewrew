{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.S3.PutObjectRetention
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Places an Object Retention configuration on an object. For more
-- information, see
-- <https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html Locking Objects>.
-- Users or accounts require the @s3:PutObjectRetention@ permission in
-- order to place an Object Retention configuration on objects. Bypassing a
-- Governance Retention configuration requires the
-- @s3:BypassGovernanceRetention@ permission.
--
-- This action is not supported by Amazon S3 on Outposts.
--
-- __Permissions__
--
-- When the Object Lock retention mode is set to compliance, you need
-- @s3:PutObjectRetention@ and @s3:BypassGovernanceRetention@ permissions.
-- For other requests to @PutObjectRetention@, only @s3:PutObjectRetention@
-- permissions are required.
module Amazonka.S3.PutObjectRetention
  ( -- * Creating a Request
    PutObjectRetention (..),
    newPutObjectRetention,

    -- * Request Lenses
    putObjectRetention_retention,
    putObjectRetention_versionId,
    putObjectRetention_requestPayer,
    putObjectRetention_contentMD5,
    putObjectRetention_bypassGovernanceRetention,
    putObjectRetention_expectedBucketOwner,
    putObjectRetention_bucket,
    putObjectRetention_key,

    -- * Destructuring the Response
    PutObjectRetentionResponse (..),
    newPutObjectRetentionResponse,

    -- * Response Lenses
    putObjectRetentionResponse_requestCharged,
    putObjectRetentionResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response
import Amazonka.S3.Types

-- | /See:/ 'newPutObjectRetention' smart constructor.
data PutObjectRetention = PutObjectRetention'
  { -- | The container element for the Object Retention configuration.
    retention :: Prelude.Maybe ObjectLockRetention,
    -- | The version ID for the object that you want to apply this Object
    -- Retention configuration to.
    versionId :: Prelude.Maybe ObjectVersionId,
    requestPayer :: Prelude.Maybe RequestPayer,
    -- | The MD5 hash for the request body.
    --
    -- For requests made using the Amazon Web Services Command Line Interface
    -- (CLI) or Amazon Web Services SDKs, this field is calculated
    -- automatically.
    contentMD5 :: Prelude.Maybe Prelude.Text,
    -- | Indicates whether this action should bypass Governance-mode
    -- restrictions.
    bypassGovernanceRetention :: Prelude.Maybe Prelude.Bool,
    -- | The account ID of the expected bucket owner. If the bucket is owned by a
    -- different account, the request will fail with an HTTP
    -- @403 (Access Denied)@ error.
    expectedBucketOwner :: Prelude.Maybe Prelude.Text,
    -- | The bucket name that contains the object you want to apply this Object
    -- Retention configuration to.
    --
    -- When using this action with an access point, you must direct requests to
    -- the access point hostname. The access point hostname takes the form
    -- /AccessPointName/-/AccountId/.s3-accesspoint./Region/.amazonaws.com.
    -- When using this action with an access point through the Amazon Web
    -- Services SDKs, you provide the access point ARN in place of the bucket
    -- name. For more information about access point ARNs, see
    -- <https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html Using access points>
    -- in the /Amazon S3 User Guide/.
    bucket :: BucketName,
    -- | The key name for the object that you want to apply this Object Retention
    -- configuration to.
    key :: ObjectKey
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'PutObjectRetention' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'retention', 'putObjectRetention_retention' - The container element for the Object Retention configuration.
--
-- 'versionId', 'putObjectRetention_versionId' - The version ID for the object that you want to apply this Object
-- Retention configuration to.
--
-- 'requestPayer', 'putObjectRetention_requestPayer' - Undocumented member.
--
-- 'contentMD5', 'putObjectRetention_contentMD5' - The MD5 hash for the request body.
--
-- For requests made using the Amazon Web Services Command Line Interface
-- (CLI) or Amazon Web Services SDKs, this field is calculated
-- automatically.
--
-- 'bypassGovernanceRetention', 'putObjectRetention_bypassGovernanceRetention' - Indicates whether this action should bypass Governance-mode
-- restrictions.
--
-- 'expectedBucketOwner', 'putObjectRetention_expectedBucketOwner' - The account ID of the expected bucket owner. If the bucket is owned by a
-- different account, the request will fail with an HTTP
-- @403 (Access Denied)@ error.
--
-- 'bucket', 'putObjectRetention_bucket' - The bucket name that contains the object you want to apply this Object
-- Retention configuration to.
--
-- When using this action with an access point, you must direct requests to
-- the access point hostname. The access point hostname takes the form
-- /AccessPointName/-/AccountId/.s3-accesspoint./Region/.amazonaws.com.
-- When using this action with an access point through the Amazon Web
-- Services SDKs, you provide the access point ARN in place of the bucket
-- name. For more information about access point ARNs, see
-- <https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html Using access points>
-- in the /Amazon S3 User Guide/.
--
-- 'key', 'putObjectRetention_key' - The key name for the object that you want to apply this Object Retention
-- configuration to.
newPutObjectRetention ::
  -- | 'bucket'
  BucketName ->
  -- | 'key'
  ObjectKey ->
  PutObjectRetention
newPutObjectRetention pBucket_ pKey_ =
  PutObjectRetention'
    { retention = Prelude.Nothing,
      versionId = Prelude.Nothing,
      requestPayer = Prelude.Nothing,
      contentMD5 = Prelude.Nothing,
      bypassGovernanceRetention = Prelude.Nothing,
      expectedBucketOwner = Prelude.Nothing,
      bucket = pBucket_,
      key = pKey_
    }

-- | The container element for the Object Retention configuration.
putObjectRetention_retention :: Lens.Lens' PutObjectRetention (Prelude.Maybe ObjectLockRetention)
putObjectRetention_retention = Lens.lens (\PutObjectRetention' {retention} -> retention) (\s@PutObjectRetention' {} a -> s {retention = a} :: PutObjectRetention)

-- | The version ID for the object that you want to apply this Object
-- Retention configuration to.
putObjectRetention_versionId :: Lens.Lens' PutObjectRetention (Prelude.Maybe ObjectVersionId)
putObjectRetention_versionId = Lens.lens (\PutObjectRetention' {versionId} -> versionId) (\s@PutObjectRetention' {} a -> s {versionId = a} :: PutObjectRetention)

-- | Undocumented member.
putObjectRetention_requestPayer :: Lens.Lens' PutObjectRetention (Prelude.Maybe RequestPayer)
putObjectRetention_requestPayer = Lens.lens (\PutObjectRetention' {requestPayer} -> requestPayer) (\s@PutObjectRetention' {} a -> s {requestPayer = a} :: PutObjectRetention)

-- | The MD5 hash for the request body.
--
-- For requests made using the Amazon Web Services Command Line Interface
-- (CLI) or Amazon Web Services SDKs, this field is calculated
-- automatically.
putObjectRetention_contentMD5 :: Lens.Lens' PutObjectRetention (Prelude.Maybe Prelude.Text)
putObjectRetention_contentMD5 = Lens.lens (\PutObjectRetention' {contentMD5} -> contentMD5) (\s@PutObjectRetention' {} a -> s {contentMD5 = a} :: PutObjectRetention)

-- | Indicates whether this action should bypass Governance-mode
-- restrictions.
putObjectRetention_bypassGovernanceRetention :: Lens.Lens' PutObjectRetention (Prelude.Maybe Prelude.Bool)
putObjectRetention_bypassGovernanceRetention = Lens.lens (\PutObjectRetention' {bypassGovernanceRetention} -> bypassGovernanceRetention) (\s@PutObjectRetention' {} a -> s {bypassGovernanceRetention = a} :: PutObjectRetention)

-- | The account ID of the expected bucket owner. If the bucket is owned by a
-- different account, the request will fail with an HTTP
-- @403 (Access Denied)@ error.
putObjectRetention_expectedBucketOwner :: Lens.Lens' PutObjectRetention (Prelude.Maybe Prelude.Text)
putObjectRetention_expectedBucketOwner = Lens.lens (\PutObjectRetention' {expectedBucketOwner} -> expectedBucketOwner) (\s@PutObjectRetention' {} a -> s {expectedBucketOwner = a} :: PutObjectRetention)

-- | The bucket name that contains the object you want to apply this Object
-- Retention configuration to.
--
-- When using this action with an access point, you must direct requests to
-- the access point hostname. The access point hostname takes the form
-- /AccessPointName/-/AccountId/.s3-accesspoint./Region/.amazonaws.com.
-- When using this action with an access point through the Amazon Web
-- Services SDKs, you provide the access point ARN in place of the bucket
-- name. For more information about access point ARNs, see
-- <https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html Using access points>
-- in the /Amazon S3 User Guide/.
putObjectRetention_bucket :: Lens.Lens' PutObjectRetention BucketName
putObjectRetention_bucket = Lens.lens (\PutObjectRetention' {bucket} -> bucket) (\s@PutObjectRetention' {} a -> s {bucket = a} :: PutObjectRetention)

-- | The key name for the object that you want to apply this Object Retention
-- configuration to.
putObjectRetention_key :: Lens.Lens' PutObjectRetention ObjectKey
putObjectRetention_key = Lens.lens (\PutObjectRetention' {key} -> key) (\s@PutObjectRetention' {} a -> s {key = a} :: PutObjectRetention)

instance Core.AWSRequest PutObjectRetention where
  type
    AWSResponse PutObjectRetention =
      PutObjectRetentionResponse
  request =
    Request.s3vhost
      Prelude.. Request.putXML defaultService
  response =
    Response.receiveEmpty
      ( \s h x ->
          PutObjectRetentionResponse'
            Prelude.<$> (h Core..#? "x-amz-request-charged")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable PutObjectRetention where
  hashWithSalt _salt PutObjectRetention' {..} =
    _salt `Prelude.hashWithSalt` retention
      `Prelude.hashWithSalt` versionId
      `Prelude.hashWithSalt` requestPayer
      `Prelude.hashWithSalt` contentMD5
      `Prelude.hashWithSalt` bypassGovernanceRetention
      `Prelude.hashWithSalt` expectedBucketOwner
      `Prelude.hashWithSalt` bucket
      `Prelude.hashWithSalt` key

instance Prelude.NFData PutObjectRetention where
  rnf PutObjectRetention' {..} =
    Prelude.rnf retention
      `Prelude.seq` Prelude.rnf versionId
      `Prelude.seq` Prelude.rnf requestPayer
      `Prelude.seq` Prelude.rnf contentMD5
      `Prelude.seq` Prelude.rnf bypassGovernanceRetention
      `Prelude.seq` Prelude.rnf expectedBucketOwner
      `Prelude.seq` Prelude.rnf bucket
      `Prelude.seq` Prelude.rnf key

instance Core.ToElement PutObjectRetention where
  toElement PutObjectRetention' {..} =
    Core.mkElement
      "{http://s3.amazonaws.com/doc/2006-03-01/}Retention"
      retention

instance Core.ToHeaders PutObjectRetention where
  toHeaders PutObjectRetention' {..} =
    Prelude.mconcat
      [ "x-amz-request-payer" Core.=# requestPayer,
        "Content-MD5" Core.=# contentMD5,
        "x-amz-bypass-governance-retention"
          Core.=# bypassGovernanceRetention,
        "x-amz-expected-bucket-owner"
          Core.=# expectedBucketOwner
      ]

instance Core.ToPath PutObjectRetention where
  toPath PutObjectRetention' {..} =
    Prelude.mconcat
      ["/", Core.toBS bucket, "/", Core.toBS key]

instance Core.ToQuery PutObjectRetention where
  toQuery PutObjectRetention' {..} =
    Prelude.mconcat
      ["versionId" Core.=: versionId, "retention"]

-- | /See:/ 'newPutObjectRetentionResponse' smart constructor.
data PutObjectRetentionResponse = PutObjectRetentionResponse'
  { requestCharged :: Prelude.Maybe RequestCharged,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'PutObjectRetentionResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'requestCharged', 'putObjectRetentionResponse_requestCharged' - Undocumented member.
--
-- 'httpStatus', 'putObjectRetentionResponse_httpStatus' - The response's http status code.
newPutObjectRetentionResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  PutObjectRetentionResponse
newPutObjectRetentionResponse pHttpStatus_ =
  PutObjectRetentionResponse'
    { requestCharged =
        Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | Undocumented member.
putObjectRetentionResponse_requestCharged :: Lens.Lens' PutObjectRetentionResponse (Prelude.Maybe RequestCharged)
putObjectRetentionResponse_requestCharged = Lens.lens (\PutObjectRetentionResponse' {requestCharged} -> requestCharged) (\s@PutObjectRetentionResponse' {} a -> s {requestCharged = a} :: PutObjectRetentionResponse)

-- | The response's http status code.
putObjectRetentionResponse_httpStatus :: Lens.Lens' PutObjectRetentionResponse Prelude.Int
putObjectRetentionResponse_httpStatus = Lens.lens (\PutObjectRetentionResponse' {httpStatus} -> httpStatus) (\s@PutObjectRetentionResponse' {} a -> s {httpStatus = a} :: PutObjectRetentionResponse)

instance Prelude.NFData PutObjectRetentionResponse where
  rnf PutObjectRetentionResponse' {..} =
    Prelude.rnf requestCharged
      `Prelude.seq` Prelude.rnf httpStatus
