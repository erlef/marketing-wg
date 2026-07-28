---
title: Support and Sponsorship
description: Support the EEF mission and activities
---
<ul>
{% for item in site.tags.sup %}

<li>
{% if item.more_link %}
  <a href="{{item.more_link}}">see more</a>
  </li>
  {% break %}
{% else %}
  <a href="{{item.url}}">{{item.date | date: "%Y-%m-%d"}} - {{item.title}}</a>
{% endif %}
{% if item.more %}<br/>{{item.more}}{% endif %}
{% if item.img %}<div class="a-card"><div class="a-card-content"><img src="{{item.img}}"/></div></div>{% endif %}
</li>
{% endfor %}
</ul>
