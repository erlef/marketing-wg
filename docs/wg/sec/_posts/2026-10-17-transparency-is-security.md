---
title: Transparency Is A Security Feature
description: Looking for vulnerabilities, creating CVEs, with reporting outcomes in the open leads to more secure software
author: Dan Janowski
---
It is unsettling to see so many vulnerability reports in all things. This is a reconciliation of how the brute force of LLMs can find our past optimism (not a friend of secure software) and the ease of bug creation. Every resolved finding and published update makes the world safer.

It is easy to be alarmed about the stream of updates, but that would misplace the alarm. Each update reduces the already existing risk. The alarm is well placed on what is yet to be found. Which is why the prevailing (and correct) strategy is to put as much LLM brute force into finding these bugs in everything as can be afforded (in tokens and human time).

All of this works because so much of our software world is based on source that is open, that anyone can inspect and examine for security flaws. Open Source has always had better security than closed source, many eyes, many interests, have consistently led to finding and squashing bugs. With closed source security is an economic risk analysis and that leads to far fewer dedicated security resources or even properly prioritizing security as an imperative.

Pay attention to the silent alarm. If you do not see a regular cadence of disclosures and updates from anywhere in your supply chain or software operational dependencies, this is a silent alarm. The only way to not find vulnerabilities right now is to not look. The only way for there to be no disclosures is to either not look or not tell. Not telling does not alleviate this silent alarm, it results in a low-information dilemma of not knowing where things stand, knowing what is safe.

Transparency is the only way we can de-risk software. Any other approach provides advantage to adversaries. "What you don't know, can hurt you" is good advise.

A note about the description: Handling of vulnerabilities, reporting to maintainers, creating CVEs, working out fixes, all need to happen undisclosed. Only after triage, fixes, or unfortunate 90-day elapsed times, would public disclosure occur. This delays tipping off adversaries at least until fixes are published. But, if a defender with an LLM can find it, anyone can find it. So this only goes so far.
