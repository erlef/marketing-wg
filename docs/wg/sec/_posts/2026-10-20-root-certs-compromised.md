---
title: Update your CA root trust stores
description: eMudhra CA Intermediate Certificates have been compromised, CA updates needed on all TLS components.
author: Dan Janowski
---
As reported by [Mozilla](https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE/m/0XofdebrAAAJ?utm_medium=email&utm_source=footer) the eMudhra intermediate CA private keys have been compromised. These CA records can only be excluded by either enabling CRL (Certificate Revocation Lists) checking or by installing updated root CA certificate stores.

CRL checking is not enabled by default largely due to performance issues with the CRL mechanism. 
Without active CRL checking, CA records can only be eliminated by installing new root CA certificates that do not include them.

* System CA certificate store (update OS or container images/packages) to include new Mozilla records
* Update [ca-store package](https://hex.pm/packages/castore) at least 1.0.22
* Update [certifi](https://hex.pm/packages/certifi) when it is updated past 2.17.0
* Update [hex](mix local.hex --force)

More information about the [eMudhra problem](https://emudhra.we-have-a-problem.com/).
