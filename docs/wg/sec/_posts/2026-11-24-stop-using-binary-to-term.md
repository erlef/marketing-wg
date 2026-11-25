---
author: Dan Janowski
title: You might not want to use binary_to_term
description: "binary_to_term is too convenient but unless you do all these things, you probably don't want to use it."
---
You know it. I know it. binary_to_term and native serialization support (e.g. DETS) are really convenient and efficient. Using data for binary_to_term from any point outside the security perimeter of your runtime is an invitation for an exploit. Read from disk, the disk is now inside your runtime. Read from the network, the network is now inside your runtime. The problem is trust. Term data coming from outside requires full trust because there is no sandbox within the runtime to quarantine these foreign terms.

The simplest solution is to *not* use binary_to_term. Use a constrained/limited encoding, e.g. JSON, and apply input validation.

The problem expands if functions or MFAs are in deserialized data. Add to that Elixir Protocols, (Enumerable, Access, Inspect, String.Chars), an additional layer of indirection can lead to unexpected/unintended evaluation of terms. Protocol implementations, the defaults or those provided anywhere in dependencies, become fertile ground for exploitation. These are all reasons to be vigilant on how term binaries are handled.

If you still want to use term binaries, here is your check list:

1. Read, understand, adhere to [guidance for serialization](https://security.erlef.org/secure_coding_and_deployment_hardening/serialisation.html) and [erlang secure coding DSG-011](https://www.erlang.org/doc/system/secure_coding.html#rule-dsg-011)
2. Validate the data you receive, always
3. Sign and/or encrypt data you may round trip outside the runtime, i.e. browser cookies, parameters. In Elixir, use [Phoenix.Token](https://phoenix.hexdocs.pm/Phoenix.Token.html#functions) or [Plug.Crypto](https://plug-crypto.hexdocs.pm/2.2.1/Plug.Crypto.html#functions) with `sign`/`verify` or `encrypt`/`decrypt`
