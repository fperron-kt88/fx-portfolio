---
title: "Portfolio"
layout: default
permalink: /portfolio/
author_profile: true
---

**December 2024 - update**

This portfolio is brand new! Content is appearing here as I dig into the
documents and give them the 2025 look.

Don't forget to <a href="javascript:;"
onclick="tidioChatApi.display(true);tidioChatApi.open()">subscribe in
the chat</a> and comeback soon!

# Projects

{% for post in site.posts %}
  <h2>{{ post.title }}</h2>
  <p>{{ post.excerpt }}</p>
  <a href="{{ post.url | relative_url }}">Read more</a>
  <hr>
{% endfor %}
