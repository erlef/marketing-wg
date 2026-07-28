<ul class="post-container">
{% for item in item_list %}
<li><img src="{{ item.logo }}" height="14px"></li>
<li><a href="{{item.url}}">{{item.title}} </a></li>
<li>{{item.date | date: "%Y-%m-%d"}}</li>
{% endfor %}
</ul>
