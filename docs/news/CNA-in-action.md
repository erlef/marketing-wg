---
layout: page
title: <img src="/logos/eef/CNA - EEF LOGO.svg" width="200px"> and <img src="/logos/eef/EEF-security.svg" width="200px"> In Action
---

# Security WG and CNA

The Erlang ecosystem [CNA](https://cna.erlef.org "CNA Home")  (CVE Numbering Authority) is operated by the EEF CISO Jonatan Männchen and the Security Working Group. Security initiatives, recommendations, and incident response are under the same umbrella.

The CNA is an EEF administrative operation and incurs material costs related to its work and professional staffing. It includes volunteer efforts, but the critical and complex nature of the work demands staff.

The CNA is funded by general [EEF
sponsorship](https://sponsor.erlef.org).
Only consistent funding can ensure we are doing all that the current security environment requires to provide the best available safety for making things and using them.

The EEF asks all companies in the community to contribute to our ecosystem-wide security operation. It benefits all users, developers, and products and 

The CNA and security
operation at the EEF has also received emergency funding from A&O. The
CNA is operating at a deficit and only community funding support can
close the gap.

  {% for post in site.tags["cna"] %}

<div class="glass-card">
      <a href="{{ post.url }}">{{ post.title }}</a>
      {{post.excerpt}}

</div>
  {% endfor %}
