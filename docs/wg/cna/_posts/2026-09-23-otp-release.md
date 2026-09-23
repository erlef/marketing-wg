---
title: "OTP Update: TLS 1.3 (critical CVE), SSH daemon, ASN.1"
author: Dan Janowski
---
The OTP release on 2026-09-22 address three CVEs:

- [CVE-2026-89422](https://cna.erlef.org/cves/CVE-2026-89422.html)
  - CRITICAL: Affects TLS 1.3 client, authentication
- [CVE-2026-68956](https://cna.erlef.org/cves/CVE-2026-68956.html)
  - HIGH: Affects SSH daemon, unchecked resource limits
- [CVE-2026-65634](https://cna.erlef.org/cves/CVE-2026-65634.html)
  - HIGH: ASN.1 decoder, resource limits
  
The following OTP releases resolve these CVEs:

- [27.3.4.18](https://www.erlang.org/patches/OTP-27.3.4.18)
- [28.5.0.7](https://www.erlang.org/patches/OTP-28.5.0.7)
- [29.1.1](https://www.erlang.org/patches/OTP-29.1.1)

## Description

### TLS 1.3 Client

A mismatch in negotiation when a malicious server provides an
unsolicited pre-shared key response to the vulnerable client leads to
the client validating the server certificate erroneously.

### SSH daemon

Allows a malicious authenticated client to elicit server memory
resource exhaustion by repeatedly opening sessions that are never
assigned to a handler.

### ASN.1 decoder

A server can send a crafted OBJECT IDENTIFIER that
results in quadratic consumption of CPU resources during decoding.

This can be triggered during X.509 certificate handling, as an initial
step during TLS handshake. This targets connecting clients (malicious
server) or during servers during mutual TLS. This being an early
handshake step in TLS, it is prior to authentication.
