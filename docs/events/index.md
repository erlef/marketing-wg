---
layout: home
description: Events
---

{% assign events = site.data.sections | where: "name", "Events" | first%}
<ul>
{% for item in events.items %}

{% if item.more_link %}
  {% continue %}
{% else %}
<li><a href="{{item.link}}">{{item.title}}</a><br/>{{item.more}}</li>
{% endif %}
{% endfor %}
</ul>
