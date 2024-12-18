---
title: "About Me"
layout: default
permalink: /about/
---

<div class="circular-image" style="float: left; margin-right: 1.5em;">
  <img src="{{ '/assets/images/avatar.jpg' | relative_url }}" alt="François Perron">
</div>

## About Me  

Hi, I’m **François Perron**, a former engineer turned systems hacker
with a lifelong drive to **build**, **fix**, and **optimize**. From
high-speed digital design, FPGAs and microcontrollers to reverse proxies and
cloud infrastructure, I thrive at the intersection of **hardware and
software**, connecting ideas across the full technology stack.

Lately, I’ve felt a pull back to my roots—**embedded electronics**
and **renewable energy systems**—where modern LLMs, cloud tools, and
accessible hardware have exploded the possibilities. The urge to build
is stronger than ever: to design, code, and tune systems that **make
things dance together**—robots, chips, sensors, data, energy systems,
and algorithms.

### What’s your next big idea?  **How can I help you achieve your
goals?**

Over the years, I’ve led startups, taught electronics, and worked across
the public and private sectors, helping turn ambitious ideas into tangible
solutions. Now, I’m focused on bringing it all together—**leveraging
what’s new to create what’s next**.

### Get in Touch  
- Reach me via **[LinkedIn](https://linkedin.com/in/francoisperron)**.  
- Check out my [Portfolio]({{ '/portfolio/' | relative_url }}).  

---

### Projects  

Pick a project from the list:  
<ul>
{% for post in site.posts %}
  <li>
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>  
    <small>{{ post.excerpt | strip_html | truncatewords: 10 }}</small> 
  </li>
{% endfor %}
</ul>
