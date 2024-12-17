---
title: "About Me"
layout: default
permalink: /about/
---

Hi, I'm François Perron. I work on projects involving electronics, systems, and more.

![Project Image](/assets/images/project1.jpg)


<ul>
{% for post in site.posts %}
  <li>
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>  
    <small>{{ post.excerpt | strip_html | truncatewords: 10 }}</small>
  </li>
{% endfor %}
</ul>
