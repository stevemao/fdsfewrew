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
-- Module      : Amazonka.S3.GetBucketWebsite
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns the website configuration for a bucket. To host website on
-- Amazon S3, you can configure a bucket as website by adding a website
-- configuration. For more information about hosting websites, see
-- <https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html Hosting Websites on Amazon S3>.
--
-- This GET action requires the @S3:GetBucketWebsite@ permission. By
-- default, only the bucket owner can read the bucket website
-- configuration. However, bucket owners can allow other users to read the
-- website configuration by writing a bucket policy granting them the
-- @S3:GetBucketWebsite@ permission.
--
-- The following operations are related to @DeleteBucketWebsite@:
--
-- -   <https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketWebsite.html DeleteBucketWebsite>
--
-- -   <https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketWebsite.html PutBucketWebsite>
module Amazonka.S3.GetBucketWebsite
  ( -- * Creating a Request
    GetBucketWebsite (..),
    newGetBucketWebsite,

    -- * Request Lenses
    getBucketWebsite_expectedBucketOwner,
    getBucketWebsite_bucket,

    -- * Destructuring the Response
    GetBucketWebsiteResponse (..),
    newGetBucketWebsiteResponse,

    -- * Response Lenses
    getBucketWebsiteResponse_redirectAllRequestsTo,
    getBucketWebsiteResponse_errorDocument,
    getBucketWebsiteResponse_indexDocument,
    getBucketWebsiteResponse_routingRules,
    getBucketWebsiteResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response
import Amazonka.S3.Types

-- | /See:/ 'newGetBucketWebsite' smart constructor.
data GetBucketWebsite = GetBucketWebsite'
  { -- | The account ID of the expected bucket owner. If the bucket is owned by a
    -- different account, the request will fail with an HTTP
    -- @403 (Access Denied)@ error.
    expectedBucketOwner :: Prelude.Maybe Prelude.Text,
    -- | The bucket name for which to get the website configuration.
    bucket :: BucketName
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetBucketWebsite' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'expectedBucketOwner', 'getBucketWebsite_expectedBucketOwner' - The account ID of the expected bucket owner. If the bucket is owned by a
-- different account, the request will fail with an HTTP
-- @403 (Access Denied)@ error.
--
-- 'bucket', 'getBucketWebsite_bucket' - The bucket name for which to get the website configuration.
newGetBucketWebsite ::
  -- | 'bucket'
  BucketName ->
  GetBucketWebsite
newGetBucketWebsite pBucket_ =
  GetBucketWebsite'
    { expectedBucketOwner =
        Prelude.Nothing,
      bucket = pBucket_
    }

-- | The account ID of the expected bucket owner. If the bucket is owned by a
-- different account, the request will fail with an HTTP
-- @403 (Access Denied)@ error.
getBucketWebsite_expectedBucketOwner :: Lens.Lens' GetBucketWebsite (Prelude.Maybe Prelude.Text)
getBucketWebsite_expectedBucketOwner = Lens.lens (\GetBucketWebsite' {expectedBucketOwner} -> expectedBucketOwner) (\s@GetBucketWebsite' {} a -> s {expectedBucketOwner = a} :: GetBucketWebsite)

-- | The bucket name for which to get the website configuration.
getBucketWebsite_bucket :: Lens.Lens' GetBucketWebsite BucketName
getBucketWebsite_bucket = Lens.lens (\GetBucketWebsite' {bucket} -> bucket) (\s@GetBucketWebsite' {} a -> s {bucket = a} :: GetBucketWebsite)

instance Core.AWSRequest GetBucketWebsite where
  type
    AWSResponse GetBucketWebsite =
      GetBucketWebsiteResponse
  request =
    Request.s3vhost
      Prelude.. Request.get defaultService
  response =
    Response.receiveXML
      ( \s h x ->
          GetBucketWebsiteResponse'
            Prelude.<$> (x Core..@? "RedirectAllRequestsTo")
            Prelude.<*> (x Core..@? "ErrorDocument")
            Prelude.<*> (x Core..@? "IndexDocument")
            Prelude.<*> ( x Core..@? "RoutingRules" Core..!@ Prelude.mempty
                            Prelude.>>= Core.may (Core.parseXMLList "RoutingRule")
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable GetBucketWebsite where
  hashWithSalt _salt GetBucketWebsite' {..} =
    _salt `Prelude.hashWithSalt` expectedBucketOwner
      `Prelude.hashWithSalt` bucket

instance Prelude.NFData GetBucketWebsite where
  rnf GetBucketWebsite' {..} =
    Prelude.rnf expectedBucketOwner
      `Prelude.seq` Prelude.rnf bucket

instance Core.ToHeaders GetBucketWebsite where
  toHeaders GetBucketWebsite' {..} =
    Prelude.mconcat
      [ "x-amz-expected-bucket-owner"
          Core.=# expectedBucketOwner
      ]

instance Core.ToPath GetBucketWebsite where
  toPath GetBucketWebsite' {..} =
    Prelude.mconcat ["/", Core.toBS bucket]

instance Core.ToQuery GetBucketWebsite where
  toQuery = Prelude.const (Prelude.mconcat ["website"])

-- | /See:/ 'newGetBucketWebsiteResponse' smart constructor.
data GetBucketWebsiteResponse = GetBucketWebsiteResponse'
  { -- | Specifies the redirect behavior of all requests to a website endpoint of
    -- an Amazon S3 bucket.
    redirectAllRequestsTo :: Prelude.Maybe RedirectAllRequestsTo,
    -- | The object key name of the website error document to use for 4XX class
    -- errors.
    errorDocument :: Prelude.Maybe ErrorDocument,
    -- | The name of the index document for the website (for example
    -- @index.html@).
    indexDocument :: Prelude.Maybe IndexDocument,
    -- | Rules that define when a redirect is applied and the redirect behavior.
    routingRules :: Prelude.Maybe [RoutingRule],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetBucketWebsiteResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'redirectAllRequestsTo', 'getBucketWebsiteResponse_redirectAllRequestsTo' - Specifies the redirect behavior of all requests to a website endpoint of
-- an Amazon S3 bucket.
--
-- 'errorDocument', 'getBucketWebsiteResponse_errorDocument' - The object key name of the website error document to use for 4XX class
-- errors.
--
-- 'indexDocument', 'getBucketWebsiteResponse_indexDocument' - The name of the index document for the website (for example
-- @index.html@).
--
-- 'routingRules', 'getBucketWebsiteResponse_routingRules' - Rules that define when a redirect is applied and the redirect behavior.
--
-- 'httpStatus', 'getBucketWebsiteResponse_httpStatus' - The response's http status code.
newGetBucketWebsiteResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetBucketWebsiteResponse
newGetBucketWebsiteResponse pHttpStatus_ =
  GetBucketWebsiteResponse'
    { redirectAllRequestsTo =
        Prelude.Nothing,
      errorDocument = Prelude.Nothing,
      indexDocument = Prelude.Nothing,
      routingRules = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | Specifies the redirect behavior of all requests to a website endpoint of
-- an Amazon S3 bucket.
getBucketWebsiteResponse_redirectAllRequestsTo :: Lens.Lens' GetBucketWebsiteResponse (Prelude.Maybe RedirectAllRequestsTo)
getBucketWebsiteResponse_redirectAllRequestsTo = Lens.lens (\GetBucketWebsiteResponse' {redirectAllRequestsTo} -> redirectAllRequestsTo) (\s@GetBucketWebsiteResponse' {} a -> s {redirectAllRequestsTo = a} :: GetBucketWebsiteResponse)

-- | The object key name of the website error document to use for 4XX class
-- errors.
getBucketWebsiteResponse_errorDocument :: Lens.Lens' GetBucketWebsiteResponse (Prelude.Maybe ErrorDocument)
getBucketWebsiteResponse_errorDocument = Lens.lens (\GetBucketWebsiteResponse' {errorDocument} -> errorDocument) (\s@GetBucketWebsiteResponse' {} a -> s {errorDocument = a} :: GetBucketWebsiteResponse)

-- | The name of the index document for the website (for example
-- @index.html@).
getBucketWebsiteResponse_indexDocument :: Lens.Lens' GetBucketWebsiteResponse (Prelude.Maybe IndexDocument)
getBucketWebsiteResponse_indexDocument = Lens.lens (\GetBucketWebsiteResponse' {indexDocument} -> indexDocument) (\s@GetBucketWebsiteResponse' {} a -> s {indexDocument = a} :: GetBucketWebsiteResponse)

-- | Rules that define when a redirect is applied and the redirect behavior.
getBucketWebsiteResponse_routingRules :: Lens.Lens' GetBucketWebsiteResponse (Prelude.Maybe [RoutingRule])
getBucketWebsiteResponse_routingRules = Lens.lens (\GetBucketWebsiteResponse' {routingRules} -> routingRules) (\s@GetBucketWebsiteResponse' {} a -> s {routingRules = a} :: GetBucketWebsiteResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
getBucketWebsiteResponse_httpStatus :: Lens.Lens' GetBucketWebsiteResponse Prelude.Int
getBucketWebsiteResponse_httpStatus = Lens.lens (\GetBucketWebsiteResponse' {httpStatus} -> httpStatus) (\s@GetBucketWebsiteResponse' {} a -> s {httpStatus = a} :: GetBucketWebsiteResponse)

instance Prelude.NFData GetBucketWebsiteResponse where
  rnf GetBucketWebsiteResponse' {..} =
    Prelude.rnf redirectAllRequestsTo
      `Prelude.seq` Prelude.rnf errorDocument
      `Prelude.seq` Prelude.rnf indexDocument
      `Prelude.seq` Prelude.rnf routingRules
      `Prelude.seq` Prelude.rnf httpStatus
