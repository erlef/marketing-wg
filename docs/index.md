---
layout: home
title: Communication
description: Communication for the EEF community
---

<a id="news"/>
<div class="b-card">
<div class="b-card-content">
<h3>News and Articles</h3>
</div>
</div>


<ul class="post-container">
{% for item in site.posts %}

<li><img src="/assets/images/eef/wg-logo/EEF-{{item.tags | first | upcase}}.svg" height="14px"></li>
<li><a href="{{item.url}}">{{item.title}} </a></li>
<li>{{item.date | date: "%Y-%m-%d"}}</li>

{% endfor %}
</ul>

{% for section in site.data.sections %}

<a id="{{section.name | slugify}}"/>
<div class="b-card">
<div class="b-card-content">
<h3>{{section.name}}</h3>
</div>
</div>

<ul class="list-wg-container">
{% for item in section.items %}

<li>{% if item.wg %}<img src="/assets/images/eef/wg-logo/EEF-{{item.wg | upcase}}.svg" height="14px">{% endif %}</li>
<li>
{% if item.more_link %}
  <a href="{{item.more_link}}">see more</a>
  </li>
  {% break %}
{% else %}
  <a href="{{item.link}}">{{item.title}}</a>
{% endif %}
{% if item.more %}<br/>{{item.more}}{% endif %}
{% if item.img %}<div class="a-card"><div class="a-card-content"><img src="{{item.img}}"/></div></div>{% endif %}
</li>
{% endfor %}
</ul>

{% endfor %}
