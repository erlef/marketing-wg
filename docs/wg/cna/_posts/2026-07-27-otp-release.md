---
title: New OTP Releases Resolve 8 CVEs
---

The Erlang/OTP Team just published [releases](https://www.erlang.org/downloads) that
include security fixes for 8 CVEs.

- [29.0.4](https://www.erlang.org/patches/OTP-29.0.4)
- [28.5.0.4](https://www.erlang.org/patches/OTP-28.5.0.4)
- [27.3.4.15](https://www.erlang.org/patches/OTP-27.3.4.15)

The CVEs addressed include:

* BEAM VM crash via integer underflow in binary_to_term BIT_BINARY_EXT decoding
  - [CVE-2026-54890](https://cna.erlef.org/cves/CVE-2026-54890.html)
* Denial of service via exponential certificate policy tree growth in path validation
  - [CVE-2026-59251](https://cna.erlef.org/cves/CVE-2026-59251.html)
* Megaco flex scanner buffer overflow via oversized property parm name
  - [CVE-2026-59250](https://cna.erlef.org/cves/CVE-2026-59250.html)
* TLS 1.2 and DTLS client accepts unoffered anonymous cipher suite, bypassing server authentication
  - [CVE-2026-55953](https://cna.erlef.org/cves/CVE-2026-55953.html)
* Heap pointer corruption via signed/unsigned mismatch in LARGE_TUPLE_EXT decoding in erts external term format decoder
  - [CVE-2026-55737](https://cna.erlef.org/cves/CVE-2026-55737.html)
* Relative path traversal in zip:unzip/zip:extract via check_dir_level depth-counter bypass 
  - [CVE-2026-47078](https://cna.erlef.org/cves/CVE-2026-47078.html)
* epmd permanent DoS via EMFILE on accept(2) in erts
  - [CVE-2026-42792](https://cna.erlef.org/cves/CVE-2026-42792.html)
* TLS/DTLS denial of service via unbounded recursion on cross-signed peer certificate chain 
  - [CVE-2026-58227](https://cna.erlef.org/cves/CVE-2026-58227.html)
