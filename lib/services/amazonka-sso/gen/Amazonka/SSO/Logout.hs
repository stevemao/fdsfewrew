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
-- Module      : Amazonka.SSO.Logout
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Removes the client- and server-side session that is associated with the
-- user.
module Amazonka.SSO.Logout
  ( -- * Creating a Request
    Logout (..),
    newLogout,

    -- * Request Lenses
    logout_accessToken,

    -- * Destructuring the Response
    LogoutResponse (..),
    newLogoutResponse,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response
import Amazonka.SSO.Types

-- | /See:/ 'newLogout' smart constructor.
data Logout = Logout'
  { -- | The token issued by the @CreateToken@ API call. For more information,
    -- see
    -- <https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html CreateToken>
    -- in the /AWS SSO OIDC API Reference Guide/.
    accessToken :: Core.Sensitive Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'Logout' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'accessToken', 'logout_accessToken' - The token issued by the @CreateToken@ API call. For more information,
-- see
-- <https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html CreateToken>
-- in the /AWS SSO OIDC API Reference Guide/.
newLogout ::
  -- | 'accessToken'
  Prelude.Text ->
  Logout
newLogout pAccessToken_ =
  Logout'
    { accessToken =
        Core._Sensitive Lens.# pAccessToken_
    }

-- | The token issued by the @CreateToken@ API call. For more information,
-- see
-- <https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html CreateToken>
-- in the /AWS SSO OIDC API Reference Guide/.
logout_accessToken :: Lens.Lens' Logout Prelude.Text
logout_accessToken = Lens.lens (\Logout' {accessToken} -> accessToken) (\s@Logout' {} a -> s {accessToken = a} :: Logout) Prelude.. Core._Sensitive

instance Core.AWSRequest Logout where
  type AWSResponse Logout = LogoutResponse
  request = Request.postJSON defaultService
  response = Response.receiveNull LogoutResponse'

instance Prelude.Hashable Logout where
  hashWithSalt _salt Logout' {..} =
    _salt `Prelude.hashWithSalt` accessToken

instance Prelude.NFData Logout where
  rnf Logout' {..} = Prelude.rnf accessToken

instance Core.ToHeaders Logout where
  toHeaders Logout' {..} =
    Prelude.mconcat
      [ "x-amz-sso_bearer_token" Core.=# accessToken,
        "Content-Type"
          Core.=# ("application/x-amz-json-1.1" :: Prelude.ByteString)
      ]

instance Core.ToJSON Logout where
  toJSON = Prelude.const (Core.Object Prelude.mempty)

instance Core.ToPath Logout where
  toPath = Prelude.const "/logout"

instance Core.ToQuery Logout where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newLogoutResponse' smart constructor.
data LogoutResponse = LogoutResponse'
  {
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'LogoutResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
newLogoutResponse ::
  LogoutResponse
newLogoutResponse = LogoutResponse'

instance Prelude.NFData LogoutResponse where
  rnf _ = ()
