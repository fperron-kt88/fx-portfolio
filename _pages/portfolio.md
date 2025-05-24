---
title: "Portfolio"
layout: default
permalink: /portfolio/
author_profile: true
---


{% for post in site.posts %}
<article style="margin-bottom: 2rem;">
  <a href="{{ post.url | relative_url }}" style="text-decoration: none; color: inherit;">
    <h2>{{ post.title }}</h2>
    {{ post.excerpt }}
  </a>
  <a href="{{ post.url | relative_url }}">Read more</a>
  <hr>
</article>
{% endfor %}
