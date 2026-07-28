---
title: Community and Communications
description: EEF Organization for community information, news, outreach
---

<ul>
{% for item in site.tags.com %}

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
