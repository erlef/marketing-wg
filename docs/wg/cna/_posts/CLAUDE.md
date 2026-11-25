# CNA posts: OTP release announcements

These posts announce OTP patch releases that fix CVEs published by the EEF CNA
(https://cna.erlef.org/cves/CVE-YYYY-NNNNNN.html). Each CVE page has a
Description, Technical analysis, Proof of concept, Impact (under "Weaknesses &
attack patterns"), Workarounds and Configurations. Read the page; don't write
from memory.

## CVE list at the top

One bullet per CVE: `- [CVE-ID](link) - <title>`, where the title is the CVE
page's `<h1>` verbatim (strip `<wbr>`).

## `# Description` section

Starts with:

> The best approach is to upgrade to OTP <versions from `# Available Versions`>.
> However, if you cannot immediately upgrade, take note of "Pre-upgrade
> mitigation" under each issue below.

Then one subsection per CVE, in the same order as the list:

```markdown
### <CVE title, verbatim>

[CVE-ID](https://cna.erlef.org/cves/CVE-ID.html)


**Who is affected:** ...

**Impact:** ...

**Pre-upgrade mitigation:** ...
```

Audience is Erlang/Elixir users and developers deciding "does this hit me and
what do I do", not people who want to know how the bug works.

- **Who is affected:** which apps/functions/configurations are exposed, and how
  to check (e.g. `erlang:system_info(emu_flavor)`). Say who is *not* affected
  when the page says so (platforms, flavors, options). Express versions as
  "OTP 27/28/29 prior to this release" rather than listing exact ranges; only
  mention older ranges (e.g. "back to OTP 17") if it matters. Don't add facts
  the CVE page doesn't contain (e.g. no lists of example hardware).
- **Impact:** what an attacker needs (what input, reachable how) and what
  happens to the user: whole-VM crash vs. one process, hang, memory/CPU
  exhaustion, header injection. Call out when supervisors/try-catch/`[safe]`
  don't help. Keep internals (C function names, register caches, tag numbers)
  out; a concrete one-line trigger example is fine. State what was *not*
  demonstrated (code execution, disclosure) if the page says so.
- **Pre-upgrade mitigation:** only the page's workaround, condensed to a
  sentence or two, written as a direct instruction. Don't repeat "upgrade to
  ..." here or use "until then" phrasing; the upgrade advice lives once at the
  top of the Description section.

**Grouping:** CVEs that share an entry point and the same advice (e.g. several
`binary_to_term` decoder bugs) go in one subsection. Give it a short descriptive
heading, list every CVE link on the line under it (comma-separated), and write
shared Who/Impact/Pre-upgrade mitigation text. When one CVE in the group has a notable
impact detail (input size needed, reads past the input, no crash unless X), add
a short paragraph inside Impact that names that CVE ID and gives the detail.

Keep each subsection short: a few sentences per field. The Impact field may get
one extra short paragraph when the bug reaches beyond the obvious entry point.
