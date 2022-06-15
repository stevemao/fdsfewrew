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
-- Module      : Amazonka.S3.GetObjectAcl
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns the access control list (ACL) of an object. To use this
-- operation, you must have @READ_ACP@ access to the object.
--
-- This action is not supported by Amazon S3 on Outposts.
--
-- __Versioning__
--
-- By default, GET returns ACL information about the current version of an
-- object. To return ACL information about a different version, use the
-- versionId subresource.
--
-- The following operations are related to @GetObjectAcl@:
--
-- -   <https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html GetObject>
--
-- -   <https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html DeleteObject>
--
-- -   <https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html PutObject>
module Amazonka.S3.GetObjectAcl
  ( -- * Creating a Request
    GetObjectAcl (..),
    newGetObjectAcl,

    -- * Request Lenses
    getObjectAcl_versionId,
    getObjectAcl_requestPayer,
    getObjectAcl_expectedBucketOwner,
    getObjectAcl_bucket,
    getObjectAcl_key,

    -- * Destructuring the Response
    GetObjectAclResponse (..),
    newGetObjectAclResponse,

    -- * Response Lenses
    getObjectAclResponse_requestCharged,
    getObjectAclResponse_grants,
    getObjectAclResponse_owner,
    getObjectAclResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response
import Amazonka.S3.Types

-- | /See:/ 'newGetObjectAcl' smart constructor.
data GetObjectAcl = GetObjectAcl'
  { -- | VersionId used to reference a specific version of the object.
    versionId :: Prelude.Maybe ObjectVersionId,
    requestPayer :: Prelude.Maybe RequestPayer,
    -- | The account ID of the expected bucket owner. If the bucket is owned by a
    -- different account, the request will fail with an HTTP
    -- @403 (Access Denied)@ error.
    expectedBucketOwner :: Prelude.Maybe Prelude.Text,
    -- | The bucket name that contains the object for which to get the ACL
    -- information.
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
    -- | The key of the object for which to get the ACL information.
    key :: ObjectKey
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetObjectAcl' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'versionId', 'getObjectAcl_versionId' - VersionId used to reference a specific version of the object.
--
-- 'requestPayer', 'getObjectAcl_requestPayer' - Undocumented member.
--
-- 'expectedBucketOwner', 'getObjectAcl_expectedBucketOwner' - The account ID of the expected bucket owner. If the bucket is owned by a
-- different account, the request will fail with an HTTP
-- @403 (Access Denied)@ error.
--
-- 'bucket', 'getObjectAcl_bucket' - The bucket name that contains the object for which to get the ACL
-- information.
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
-- 'key', 'getObjectAcl_key' - The key of the object for which to get the ACL information.
newGetObjectAcl ::
  -- | 'bucket'
  BucketName ->
  -- | 'key'
  ObjectKey ->
  GetObjectAcl
newGetObjectAcl pBucket_ pKey_ =
  GetObjectAcl'
    { versionId = Prelude.Nothing,
      requestPayer = Prelude.Nothing,
      expectedBucketOwner = Prelude.Nothing,
      bucket = pBucket_,
      key = pKey_
    }

-- | VersionId used to reference a specific version of the object.
getObjectAcl_versionId :: Lens.Lens' GetObjectAcl (Prelude.Maybe ObjectVersionId)
getObjectAcl_versionId = Lens.lens (\GetObjectAcl' {versionId} -> versionId) (\s@GetObjectAcl' {} a -> s {versionId = a} :: GetObjectAcl)

-- | Undocumented member.
getObjectAcl_requestPayer :: Lens.Lens' GetObjectAcl (Prelude.Maybe RequestPayer)
getObjectAcl_requestPayer = Lens.lens (\GetObjectAcl' {requestPayer} -> requestPayer) (\s@GetObjectAcl' {} a -> s {requestPayer = a} :: GetObjectAcl)

-- | The account ID of the expected bucket owner. If the bucket is owned by a
-- different account, the request will fail with an HTTP
-- @403 (Access Denied)@ error.
getObjectAcl_expectedBucketOwner :: Lens.Lens' GetObjectAcl (Prelude.Maybe Prelude.Text)
getObjectAcl_expectedBucketOwner = Lens.lens (\GetObjectAcl' {expectedBucketOwner} -> expectedBucketOwner) (\s@GetObjectAcl' {} a -> s {expectedBucketOwner = a} :: GetObjectAcl)

-- | The bucket name that contains the object for which to get the ACL
-- information.
--
-- When using this action with an access point, you must direct requests to
-- the access point hostname. The access point hostname takes the form
-- /AccessPointName/-/AccountId/.s3-accesspoint./Region/.amazonaws.com.
-- When using this action with an access point through the Amazon Web
-- Services SDKs, you provide the access point ARN in place of the bucket
-- name. For more information about access point ARNs, see
-- <https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html Using access points>
-- in the /Amazon S3 User Guide/.
getObjectAcl_bucket :: Lens.Lens' GetObjectAcl BucketName
getObjectAcl_bucket = Lens.lens (\GetObjectAcl' {bucket} -> bucket) (\s@GetObjectAcl' {} a -> s {bucket = a} :: GetObjectAcl)

-- | The key of the object for which to get the ACL information.
getObjectAcl_key :: Lens.Lens' GetObjectAcl ObjectKey
getObjectAcl_key = Lens.lens (\GetObjectAcl' {key} -> key) (\s@GetObjectAcl' {} a -> s {key = a} :: GetObjectAcl)

instance Core.AWSRequest GetObjectAcl where
  type AWSResponse GetObjectAcl = GetObjectAclResponse
  request =
    Request.s3vhost
      Prelude.. Request.get defaultService
  response =
    Response.receiveXML
      ( \s h x ->
          GetObjectAclResponse'
            Prelude.<$> (h Core..#? "x-amz-request-charged")
            Prelude.<*> ( x Core..@? "AccessControlList"
                            Core..!@ Prelude.mempty
                            Prelude.>>= Core.may (Core.parseXMLList "Grant")
                        )
            Prelude.<*> (x Core..@? "Owner")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable GetObjectAcl where
  hashWithSalt _salt GetObjectAcl' {..} =
    _salt `Prelude.hashWithSalt` versionId
      `Prelude.hashWithSalt` requestPayer
      `Prelude.hashWithSalt` expectedBucketOwner
      `Prelude.hashWithSalt` bucket
      `Prelude.hashWithSalt` key

instance Prelude.NFData GetObjectAcl where
  rnf GetObjectAcl' {..} =
    Prelude.rnf versionId
      `Prelude.seq` Prelude.rnf requestPayer
      `Prelude.seq` Prelude.rnf expectedBucketOwner
      `Prelude.seq` Prelude.rnf bucket
      `Prelude.seq` Prelude.rnf key

instance Core.ToHeaders GetObjectAcl where
  toHeaders GetObjectAcl' {..} =
    Prelude.mconcat
      [ "x-amz-request-payer" Core.=# requestPayer,
        "x-amz-expected-bucket-owner"
          Core.=# expectedBucketOwner
      ]

instance Core.ToPath GetObjectAcl where
  toPath GetObjectAcl' {..} =
    Prelude.mconcat
      ["/", Core.toBS bucket, "/", Core.toBS key]

instance Core.ToQuery GetObjectAcl where
  toQuery GetObjectAcl' {..} =
    Prelude.mconcat
      ["versionId" Core.=: versionId, "acl"]

-- | /See:/ 'newGetObjectAclResponse' smart constructor.
data GetObjectAclResponse = GetObjectAclResponse'
  { requestCharged :: Prelude.Maybe RequestCharged,
    -- | A list of grants.
    grants :: Prelude.Maybe [Grant],
    -- | Container for the bucket owner\'s display name and ID.
    owner :: Prelude.Maybe Owner,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetObjectAclResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'requestCharged', 'getObjectAclResponse_requestCharged' - Undocumented member.
--
-- 'grants', 'getObjectAclResponse_grants' - A list of grants.
--
-- 'owner', 'getObjectAclResponse_owner' - Container for the bucket owner\'s display name and ID.
--
-- 'httpStatus', 'getObjectAclResponse_httpStatus' - The response's http status code.
newGetObjectAclResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetObjectAclResponse
newGetObjectAclResponse pHttpStatus_ =
  GetObjectAclResponse'
    { requestCharged =
        Prelude.Nothing,
      grants = Prelude.Nothing,
      owner = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | Undocumented member.
getObjectAclResponse_requestCharged :: Lens.Lens' GetObjectAclResponse (Prelude.Maybe RequestCharged)
getObjectAclResponse_requestCharged = Lens.lens (\GetObjectAclResponse' {requestCharged} -> requestCharged) (\s@GetObjectAclResponse' {} a -> s {requestCharged = a} :: GetObjectAclResponse)

-- | A list of grants.
getObjectAclResponse_grants :: Lens.Lens' GetObjectAclResponse (Prelude.Maybe [Grant])
getObjectAclResponse_grants = Lens.lens (\GetObjectAclResponse' {grants} -> grants) (\s@GetObjectAclResponse' {} a -> s {grants = a} :: GetObjectAclResponse) Prelude.. Lens.mapping Lens.coerced

-- | Container for the bucket owner\'s display name and ID.
getObjectAclResponse_owner :: Lens.Lens' GetObjectAclResponse (Prelude.Maybe Owner)
getObjectAclResponse_owner = Lens.lens (\GetObjectAclResponse' {owner} -> owner) (\s@GetObjectAclResponse' {} a -> s {owner = a} :: GetObjectAclResponse)

-- | The response's http status code.
getObjectAclResponse_httpStatus :: Lens.Lens' GetObjectAclResponse Prelude.Int
getObjectAclResponse_httpStatus = Lens.lens (\GetObjectAclResponse' {httpStatus} -> httpStatus) (\s@GetObjectAclResponse' {} a -> s {httpStatus = a} :: GetObjectAclResponse)

instance Prelude.NFData GetObjectAclResponse where
  rnf GetObjectAclResponse' {..} =
    Prelude.rnf requestCharged
      `Prelude.seq` Prelude.rnf grants
      `Prelude.seq` Prelude.rnf owner
      `Prelude.seq` Prelude.rnf httpStatus
