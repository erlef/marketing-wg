---
layout: home
title: Articles
description: All Articles
---

<ul class="post-container">
{% for item in site.posts %}

<li><a href="/wg/{{item.tags | first}}"><img src="/assets/images/eef/wg-logo/EEF-{{item.tags | first | upcase}}.svg" height="14px"></a></li>
<li><a href="{{item.url}}">{{item.title}} </a></li>
<li>{{item.date | date: "%Y-%m-%d"}}</li>

{% endfor %}
</ul>
