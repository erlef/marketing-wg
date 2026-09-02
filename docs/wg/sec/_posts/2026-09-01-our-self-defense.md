---
title: Our self() Defense
description: Defending our ecosystem against AI threats
---
Vulnerability scanning with AI has passed from security slop to legitimate, and with it is security code analysis at scale. This is now an activity that cannot be ignored since these same tools can be used for attack.

## Quick Backstory

Before this was well established, way back in April, curiosity was put to the hacking test by Peter Ullrich at the end of ElixirConf-EU '26. The question: had AI reached a tipping point in code security analysis? The first CVE was issued.

From that discovery, Peter Ullrich and Jonatan Männchen (EEF CISO) began a sprint through the core of our ecosystem and kept finding vulnerabilities and issuing CVEs.

Jonatan had spent the past 18 months (starting in January 2025) building up the Erlang ecosystem security institutions (including establishing our own CNA), processes, and public education. That period included a full Hex security audit, with vulnerability findings and remediation, the policy shift to accepting only MFA for publishing. We have also applied for a two-year grant to go well beyond these steps.

Now Peter and Jonatan were fully engaged in a new battle that was not planned for. The effort itself evolved from curiosity to interest to panic to feeling the weight of responsibility for an entire ecosystem, as Atlas holds the world. At a pace that could not be sustained.

We were not prepared for the compounded CVE publishing growth rate of 60% per month. In January there was one reported CVE, in August there were 80. Reporting was bottlenecked by the limited process throughput of the existing tools. In response, we rebuilt the tooling and processes to accelerate triage and handling, while struggling to keep up with the old tools under increasing load. Going forward, we expect the monthly CVE reporting rate to climb higher.



## Reinforcement

Alone, we are not. Every open-source ecosystem is facing the same frontier. An effective defense requires dedicated personnel, funding is the starting problem.

[Alpha-Omega](https://alpha-omega.dev/) came to the rescue with vital funding and the grant came quickly. Enough to make a serious start, but only for a time. The grant created our own [Security Engineer in Residence (SEiR)](https://alpha-omega.dev/blog/join-the-fight-building-a-team-of-open-source-security-engineers-in-residence/) to perform our defensive research and move discovery forward. Our relationship with Alpha-Omega also facilitates ongoing cross-ecosystem collaboration with the SEiRs of the other major open source ecosystems. We thank Alpha-Omega for their financial support and the resources for our common cause.

## Up front Conclusions

The next few sections cover our strategy, approach, accomplishments and impact. The critical synopsis is that the process described for ecosystem-wide scanning is resource and time intensive. The human process demands dedicated staff, our SEiR, to handle triage, qualification, verification and judgment, coupled with the security-sensitive (pre-disclosure) nature of the work, specialized knowledge, and consistent accountability. Currently, all this is done with 1.3 full-time equivalent staff, which is not enough.

The ecosystem-wide benefits of this work should be clear. What may not be clear is that without the EEF doing this work, there is no other entity or company to coordinate or execute this process. Yet this effort is now table stakes in protecting our ecosystem, any ecosystem, against offensive AI driven attack scenarios.

Ongoing funding from within our community is the only sustainable path forward. The Alpha-Omega grant has given us valuable time, and for that we are grateful. But it will only last a few months. We have to make the investment ourselves, without delay. No one is coming to save us. We have to save ourselves.

## The Process, Our Defensive Action

With the additional funding provided by Alpha-Omega, we are engaged in an ecosystem wide defensive action that includes:

- Vulnerability Scanning of the top 1000 used Hex dependencies with the latest available models
- Evolving our scanning harness and approach based on continuous evaluation
- Triage of findings, evaluating practical severity
- Engage with the upstream to notify and coordinate fixes and the process of CVE creation and releases
- Publish CVEs as well as security guidance advisories
- Tooling and process evolution to account for previously 1 CVEs/month to 80 CVEs/month

## Our Finding and Advisory Process

On a per-finding or advisory basis, we are deeply involved in the process between finding and remedy. Most CNAs are only reporting infrastructure. Our CNA goes much further by engaging with all parts of the process with an ecosystem-wide scope, including:

- supporting maintainers across our ecosystem throughout the process
- verify fix candidates
- assist or develop fixes in some cases
- collate extensive detail with ecosystem specific data to provide clear and actionable advisories
- publishing CVE and OSV records

The high quality of our advisories enable OSV report integration with Hex to provide developers and security tools with detailed and up to date notifications across hex package searches and developer hex tools. The latter can be integrated into scanning actions, CI actions at developer's discretion.

This focus, effort and quality is paying off by the EEF CNA scoring Top-10 globally by [CNA Scorecard](https://cnascorecard.org/cna/index.html) and places well for our size by [CVE reporting volume](https://cve.icu/cna.html#mode=current).

## Accomplishments

What started as a GitHub actions driven process has evolved twice, under heavy load, to a purpose built vulnerability system we call [Varsel](https://github.com/erlef-cna/varsel). At the onset of AI driven findings, the old approaches could not manage the volume, nor support need-to-know workflows that allow more participants in the process.

Our SEiR has scanned and triaged 100 of the top 1000 Hex packages, and our core infrastructure including Erlang/OTP, Elixir and Hex itself. The findings break down about evenly into thirds: vulnerability (becomes a CVE), bug (to be upstreamed), dead-end (discarded). Nearly 50% of scanned projects have vulnerability findings and have thus far led to over 200 CVEs (not all have been released yet). Beyond the top 100, dependency download counts decline quickly, but there are usage/criticality factors not represented by this metric. Scanning beyond the top 100 is proceeding but is resource constrained.

## Important Advisories

Some examples of findings that have a broad effect on our ecosystem:

- [TLS 1.2 and DTLS (OTP) CVE-2026-55953](https://cna.erlef.org/cves/CVE-2026-55953.html)
- [Path traversal bypass in zip (OTP) CVE-2026-47078](https://cna.erlef.org/cves/CVE-2026-47078.html)
- [Longpoll unbounded memory allocation (Bandit, Phoenix) CVE-2026-32689](https://cna.erlef.org/cves/CVE-2026-32689.html)

Ongoing articles, advisories and reports are available at:

- [EEF CNA](https://cna.erlef.org)
- [Security Information](https://com.erlef.org/wg/sec/)
- [CNA Information](https://com.erlef.org/wg/cna/)

## Forward Defense

The environment and AI scanning capability is evolving rapidly. We expect new models to make new findings driving continual iteration of scanning. No matter how much we accomplish today we cannot consider any one accomplishment as a last word.

Since we cannot know how long this period will last, nor how many vulnerabilities, nor the rate of discovery, we see process investments as essential. In particular, steps to decentralize will increase autonomy and concurrency. To that end, our initial goals are:

- Continue to improve tooling so that maintainers can directly manage the disclosure process
  - These improvements will delegate increasing amounts of agency to maintainers and uphold our established quality standards
- Scanning automation
  - Tools for projects to scan and triage autonomously
- Easier and more accessible reporting such as directly through hex - **Live as of August 18th**


## EEF Security Engineers in Residence

| ![Jonatan Männchen, EEF CISO, SEiR](/assets/images/people/Jonatan-Männchen.jpeg){: width="300"}  | ![Peter Ullrich, SEiR](/assets/images/people/Peter-Ullrich.jpeg){: width="300"}  | ![Eric Meadows-Jönsson, Hex](/assets/images/people/Eric-Meadows-Jönsson.jpeg){: width="300"}  |
|:-:|:-:|:-:|
| Jonatan Männchen | Peter Ullrich  | Eric Meadows-Jönsson |
| EEF CISO, SEiR  | SEiR | SEiR, Hex Core Team |




