---
title: Bandit Fixes 11 High-Severity Vulnerabilities
description: An AI-assisted audit found 11 vulnerabilities in Bandit that let unauthenticated requests exhaust server resources. All of them are fixed in the latest release.
author: Peter Ullrich
---

We published 11 CVEs for [Bandit](https://hex.pm/packages/bandit) today, most of them rated 8.7 or 8.2 **(HIGH)**. Thanks to the hard work of [Mat Trudel](https://github.com/mtrudel/), the maintainer of Bandit, all of them are fixed in the latest version, `1.14.0`, so please update your applications immediately. Most of the vulnerabilities allow unauthenticated requests to exhaust server resources, so you are affected if you serve a Bandit endpoint publicly. You can find the details for all CVEs on our [CNA website](https://cna.erlef.org/cves?q=bandit).

We scanned Bandit with Opus 4.6 in April and with Opus 4.8 in June 2026. The April scan found 7 CVEs and the June scan only 1, so this batch of 11 came as a surprise. We found the current batch with Opus 5.5 and confirmed it with Mythos 5.1, which found no additional vulnerabilities. Today's release shows that the cybersecurity capabilities of LLMs are still growing at a significant pace, and libraries we consider "safe" today may not stay that way for long. That's why we must keep rescanning libraries as new models come out, even ones that previous scans found to be safe.

Our best defense against attackers exploiting AI-found vulnerabilities is still to find them first. EEF funding for this security work is running out and is the only security defense effort with ecosystem-wide scope. If you can help us secure the ecosystem, please visit [sponsor.erlef.org](https://sponsor.erlef.org/) to see the sponsorship options.
