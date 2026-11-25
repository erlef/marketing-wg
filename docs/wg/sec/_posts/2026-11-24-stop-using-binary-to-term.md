---
author: Dan Janowski
title: Stop using binary_to_term
description: "binary_to_term is too convenient, unless you do all these things, pretend it doesn't exist."
---
You know it. I know it. binary_to_term and native serialization support (e.g. DETS) are really convenient and efficient. Using data for binary_to_term from any point outside the security perimeter of your runtime is an invitation for an exploit. Read from disk, the disk is now inside your runtime. Read from the network, the network is now inside your runtime. The problem is trust. Term data coming from outside requires full trust because there is no sandbox within the runtime to quarantine these foreign terms.

The best thing to do is *not* use binary_to_term. Use a constrained/limited encoding, e.g. JSON, and apply input validation.

If you still want to use term binaries, here is your check list:

1. Read, understand, adhere to [guidance for serialization](https://security.erlef.org/secure_coding_and_deployment_hardening/serialisation.html)
2. Validate the data you receive, always
3. Sign and/or encrypt data you may round trip outside the runtime, i.e. browser cookies, parameters. In Elixir, use [Phoenix.Token](https://phoenix.hexdocs.pm/Phoenix.Token.html#functions) or [Plug.Crypto](https://plug-crypto.hexdocs.pm/2.2.1/Plug.Crypto.html#functions) with `sign`/`verify` or `encrypt`/`decrypt`
