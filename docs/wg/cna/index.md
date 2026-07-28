---
title: CNA for the Erlang Ecosystem
description: The EEF Operates our Ecosystem CNA
---

The Erlang ecosystem [CNA](https://cna.erlef.org "CNA Home")  (CVE Numbering Authority) is operated by the EEF CISO Jonatan Männchen and the [Security Working Group](/wg/sec).

Follow our CISO:

- X/Twitter: [@maennchen_](https://x.com/maennchen_)
- LinkedIn: [maennchen](https://www.linkedin.com/in/maennchen/)

The CNA is an EEF administrative operation. Due to the sensitive, critical and complex nature of the work, professional staff is required in addition to volunteer efforts. Operation is funded by a combination of general support from our sponsors plus industry and government grants. Please consider [supporting this effort](/wg/sup).

<h2>News and Articles</h2>

<ul>
{% for item in site.tags.cna %}

<li>
{% if item.more_link %}
  <a href="{{item.more_link}}">see more</a>
  </li>
  {% break %}
{% else %}
  <a href="{{item.url}}">{{item.date | date: "%Y-%m-%d"}} - {{item.title}} </a>
{% endif %}
{% if item.more %}<br/>{{item.more}}{% endif %}
{% if item.img %}<div class="a-card"><div class="a-card-content"><img src="{{item.img}}"/></div></div>{% endif %}
</li>
{% endfor %}
</ul>
