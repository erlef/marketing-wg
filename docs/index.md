---
layout: home
description: Communication
---

<a id="news"/>
<div class="b-card">
<div class="b-card-content">
<h3>News and Articles</h3>
</div>
</div>


<ul>
{% for item in site.posts %}

<li>
{% if item.more_link %}
  <a href="{{item.more_link}}">see more</a>
  </li>
  {% break %}
{% else %}
  <a href="{{item.url}}"><span style="display: inline-block; min-width: 3em">{{item.tags | first}}</span> {{item.date | date: "%Y-%m-%d"}} - {{item.title}} </a>
{% endif %}
{% if item.more %}<br/>{{item.more}}{% endif %}
{% if item.img %}<div class="a-card"><div class="a-card-content"><img src="{{item.img}}"/></div></div>{% endif %}
</li>
{% endfor %}
</ul>

{% for section in site.data.sections %}

<a id="{{section.name | slugify}}"/>
<div class="b-card">
<div class="b-card-content">
<h3>{{section.name}}</h3>
</div>
</div>

<ul>
{% for item in section.items %}

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
