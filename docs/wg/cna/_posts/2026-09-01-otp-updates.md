---
title: OTP updates address http and integer vulnerabilities
description: Remedies for http client and server bugs, integer serialization DoS
author: Dan Janowski
---
Today Erlang/OTP released the following versions to address vulnerabilities described below:

- [OTP 29.0.6](https://www.erlang.org/patches/OTP-29.0.6)
- [OTP 28.5.0.6](https://www.erlang.org/patches/OTP-28.5.0.6)
- [OTP 27.3.4.17](https://www.erlang.org/patches/OTP-27.3.4.17)

## Two themes

The remedies follow two themes:

- http client and server updates
  - 12 related CVEs 
  - [Lukas Backström](https://github.com/garazdawi) did an audit, discovering many of them and also fixed other non-vulnerability bugs
- Integer DOS CVEs
  - parsing, serialization


## Notable background

After the issuance of [CVE-2026-49762](https://cna.erlef.org/cves/CVE-2026-49762.html) and the 
 [GitHub Security Advisory ](https://github.com/elixir-lang/elixir/security/advisories/GHSA-w2h8-8x3g-278p)
dealing with integer serialization in Elixir, a more general discussion was started after realizing this is a common issue.

The discussion proceeded with [participants](https://cna.erlef.org/cves/CVE-2026-59696.html#credits) from across the ecosystem to consider solutions.

Integer handling in Erlang is seamless to users and yet provides nearly unbounded number scaling. 
However, handling of large integers (larger than 10<sup>100,000</sup>), especially during serialization, is multiplication expensive since base-10 string digits must be converted to base-2 to become an erlang integer.
This cost becomes a vulnerability when serializing untrusted integer string input.

One approach considered was to alter the way scaling behaviour of integers at a low level. But this would be a breaking change and was deemed as destabilizing. These current OTP releases take a more detailed, non-breaking approach to this class of problem, not impacting existing software or practices.

## Implications

If you are writing or maintaining code that is parsing integers, this topic important to consider. If you have questions regarding impact or approaches please contact the [CNA](https://cna.erlef.org/contact)
