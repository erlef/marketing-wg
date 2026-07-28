---
title: Security Working Group
description: Security recommendations and initiatives
---
The Security working group develops security initiatives and recommendations. It also has oversight of the [EEF CNA](/wg/cna).

<ul>
{% for item in site.tags.sec %}

<li>
{% if item.more_link %}
  <a href="{{item.more_link}}">see more</a>
  </li>
  {% break %}
{% else %}
  <a href="{{item.url}}">{{item.title}}</a>
{% endif %}
{% if item.more %}<br/>{{item.more}}{% endif %}
{% if item.img %}<div class="a-card"><div class="a-card-content"><img src="{{item.img}}"/></div></div>{% endif %}
</li>
{% endfor %}
</ul>
