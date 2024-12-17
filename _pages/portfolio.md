---
title: "Portfolio"
layout: default
permalink: /portfolio/
author_profile: true
---

## Projects

{% for post in site.posts %}
  <h3>{{ post.title }}</h3>
  <p>{{ post.excerpt }}</p>
  <a href="{{ post.url }}">Read more</a>
  <hr>
{% endfor %}
