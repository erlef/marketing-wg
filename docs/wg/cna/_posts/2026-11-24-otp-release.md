---
title: "OTP Update: CVE fixes for XML, BER, binary_to_term, MacOS"
author: Dan Janowski
---
# OTP Release 2026-11-24

This OTP release addresses nine CVEs:

- [CVE-2026-115747](https://cna.erlef.org/cves/CVE-2026-115747.html) - AArch64 JIT register-cache bug allows VM denial of service via XML
- [CVE-2026-116225](https://cna.erlef.org/cves/CVE-2026-116225.html) - Quadratic CPU Denial of Service in SNMP BER Object Identifier Sub-Identifier Decoding
- [CVE-2026-116293](https://cna.erlef.org/cves/CVE-2026-116293.html) - binary_to_term Heap Overrun via NEWER_REFERENCE_EXT with Zero ID Words Aborts the VM
- [CVE-2026-116295](https://cna.erlef.org/cves/CVE-2026-116295.html) - CRLF injection in httpc request headers
- [CVE-2026-116382](https://cna.erlef.org/cves/CVE-2026-116382.html) - Attacker-controlled ESI headers cause persistent atom-table growth in `inets`
- [CVE-2026-117642](https://cna.erlef.org/cves/CVE-2026-117642.html) - binary_to_term Stack Exhaustion via Nested Funs in NEW_FUN_EXT and EXPORT_EXT Aborts the VM
- [CVE-2026-119443](https://cna.erlef.org/cves/CVE-2026-119443.html) - XML Scan Untrusted DTD Which May Result in out of Memory Crash
- [CVE-2026-120961](https://cna.erlef.org/cves/CVE-2026-120961.html) - binary_to_term Heap Overrun via FLOAT_EXT Without Terminating Zero Byte May Abort the VM
- [CVE-2026-125658](https://cna.erlef.org/cves/CVE-2026-125658.html) - Use after free in erts file name normalization on macOS

# Available Versions

The following OTP releases resolve these CVEs:

- [29.1.3](https://www.erlang.org/patches/OTP-29.1.3)
- [28.5.0.9](https://www.erlang.org/patches/OTP-28.5.0.9)
- [27.3.4.20](https://www.erlang.org/patches/OTP-27.3.4.20)

# Description

The best approach is to upgrade to OTP 29.1.3, 28.5.0.9, or 27.3.4.20. However, if you cannot immediately upgrade, take note of "Pre-upgrade mitigation" under each issue below.

### AArch64 JIT register-cache bug allows VM denial of service via XML

[CVE-2026-115747](https://cna.erlef.org/cves/CVE-2026-115747.html)


**Who is affected:** Nodes running OTP 27/28/29 prior to this release on ARM64 hardware with the JIT enabled. Check with `erlang:system_info(emu_flavor)`; if it returns `jit` on an ARM64 host, you are affected. x86-64 hosts and interpreter (`emu`) builds are not affected.

**Impact:** An attacker who can get your application to parse XML with `xmerl_sax_parser` can crash the entire BEAM VM with a single small document. A numeric character reference that is too large (for example `&#576460752303423488;`) should be rejected with a parse error, but instead triggers a segmentation fault. The whole node goes down along with every application on it, and supervisors cannot recover because this is a native crash, not an Erlang exception. No crash dump is written. Code execution and data disclosure have not been demonstrated.

The bug is in the JIT itself, so other code that uses a chained range guard (`A =< X, X < B`) on a large integer can hit the same crash, not just the XML parser.

**Pre-upgrade mitigation:** Run the emulator without the JIT on ARM64 hosts (`erl -emu_flavor emu` if the interpreter flavor is installed, or build OTP with `--disable-jit`), at a performance cost.

### Quadratic CPU Denial of Service in SNMP BER Object Identifier Sub-Identifier Decoding

[CVE-2026-116225](https://cna.erlef.org/cves/CVE-2026-116225.html)


**Who is affected:** Nodes running an SNMP agent or manager from the `snmp` application on OTP 27/28/29 prior to this release (and older releases back to OTP 17) that can receive UDP datagrams from untrusted hosts.

**Impact:** An unauthenticated attacker can send a low rate of small, crafted SNMP messages that each take a very long time to decode. Decoding happens in the single network interface process, so while the attack continues, the agent or manager stops handling legitimate SNMP traffic. Community strings and SNMPv3 credentials don't help because messages are decoded before they are checked.

**Pre-upgrade mitigation:** Restrict the SNMP UDP ports to trusted management hosts with a firewall or a dedicated management interface, and disable SNMPv1/v2c if you don't need them.

### binary_to_term decoder bugs that can abort the VM

[CVE-2026-116293](https://cna.erlef.org/cves/CVE-2026-116293.html), [CVE-2026-117642](https://cna.erlef.org/cves/CVE-2026-117642.html), [CVE-2026-120961](https://cna.erlef.org/cves/CVE-2026-120961.html)


**Who is affected:** Applications on OTP 27/28/29 prior to this release that pass untrusted bytes to `binary_to_term/1,2` or `enif_binary_to_term()`, including through libraries that do so for you.

**Impact:** A crafted input can make the decoder abort the whole VM, taking down every application on the node. Supervisors, `try`/`catch` and the `[safe]` option do not prevent it.

CVE-2026-116293 needs only a few hundred bytes of input. CVE-2026-117642 needs a fairly large input, deeply nested enough to exhaust the scheduler thread's stack.

CVE-2026-120961 also makes the decoder read bytes past the end of the input, which change the decoded float value, and it can change one `,` byte after the input to `.`. It aborts the VM only when that read reaches unmapped memory. No arbitrary write or code execution was shown.

**Pre-upgrade mitigation:** Don't call `binary_to_term` on untrusted data; use JSON or another format for external input. If distribution is reachable from untrusted networks, use TLS with client certificate verification.

### CRLF injection in httpc request headers

[CVE-2026-116295](https://cna.erlef.org/cves/CVE-2026-116295.html)


**Who is affected:** Applications on OTP 27/28/29 prior to this release that put attacker-influenced data into header names or values passed to `httpc:request/4,5`. Applications that only send constant or validated headers are not affected, and the URL/request line is not affected.

**Impact:** A CR/LF in a header value ends the header line early, so an attacker can add or override headers such as `Authorization`, `Cookie`, `Host` or `X-Forwarded-For` on the outgoing request. With a blank line they can also append a second request of their own on the same connection. This can affect authentication, routing or caching on the target server or proxies in between.

**Pre-upgrade mitigation:** Reject header names and values containing `\r`, `\n` or `\0` before calling `httpc`, and use an allowlist when forwarding headers from another source.

### Attacker-controlled ESI headers cause persistent atom-table growth in `inets`

[CVE-2026-116382](https://cna.erlef.org/cves/CVE-2026-116382.html)


**Who is affected:** `inets` `httpd` servers on OTP 27/28/29 prior to this release with at least one `erl_script_alias` (ESI) configured. Only clients that can reach an ESI URL can trigger it; behind `mod_auth`, that means authenticated clients. `mod_cgi` and the `httpc` client are not affected.

**Impact:** Each request with a specially named header permanently creates a new atom, and atoms are never garbage collected. An unauthenticated client sending ordinary HTTP requests can fill the atom table, at which point the whole VM aborts, taking down every application on the node, not just `httpd`.

**Pre-upgrade mitigation:** Remove `erl_script_alias` if you don't need ESI, or put `httpd` behind a reverse proxy that forwards only an allowlist of request headers to ESI URLs.

### XML Scan Untrusted DTD Which May Result in out of Memory Crash

[CVE-2026-119443](https://cna.erlef.org/cves/CVE-2026-119443.html)


**Who is affected:** Applications on OTP 27/28/29 prior to this release that parse untrusted XML with `xmerl_scan:string/1,2` or `xmerl_scan:file/1,2` using default options. The OTP 27 default of `allow_entities` = false does not protect you.

**Impact:** An XML document whose `<!DOCTYPE>` names a local file makes the parser read that file, whether or not validation is enabled. Pointing it at `file:///dev/zero` makes the node read without end until the operating system kills it for running out of memory, taking down every application on the node. The reporter saw memory reach 64 GB within five seconds.

**Pre-upgrade mitigation:** Pass a `fetch_fun` that refuses external resources, e.g. `{fetch_fun, fun(_, S) -> {ok, not_fetched, S} end}`, to `xmerl_scan:string/2` or `xmerl_scan:file/2`.

### Use after free in erts file name normalization on macOS

[CVE-2026-125658](https://cna.erlef.org/cves/CVE-2026-125658.html)


**Who is affected:** Nodes on macOS running OTP 27/28/29 prior to this release with the default UTF-8 file name encoding, that list directories or read symlinks where an attacker can choose a file name. Linux and other platforms are not affected.

**Impact:** A file, directory or symlink target whose name starts with a Unicode combining mark (such as U+0301) corrupts memory when the VM decodes the name. `file:list_dir/1`, `file:del_dir_r/1` and `filelib:wildcard/1` on such a directory hang and the VM ignores SIGTERM. `file:read_link/1` on such a symlink aborts the VM. Only loss of availability was demonstrated.

**Pre-upgrade mitigation:** Start the VM with `+fnl` (e.g. via `ERL_FLAGS`), noting that non-ASCII file names are then returned byte-by-byte as Latin-1.
