---
title: "Portfolio"
layout: default
permalink: /portfolio/
author_profile: true
---

**December 2024 - update**

This portfolio is brand new! Content is appearing here as I dig into the documents of the past and treat them to look modern in 2024. Bookmark this and comeback soon!

## Projects

{% for post in site.posts %}
  <h3>{{ post.title }}</h3>
  <p>{{ post.excerpt }}</p>
  <a href="{{ post.url | relative_url }}">Read more</a>
  <hr>
{% endfor %}
