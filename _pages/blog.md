---
layout: blog
title: Blog
permalink: /blog/
description: "Blog posts by Tanvir Hossain on hardware security, research insights, and academic life."
keywords: "hardware security blog, research blog, PhD student blog, microelectronics"
jumbo_txt: |
  Thoughts on hardware security, research insights, and my journey as a PhD researcher.
---

{% if site.posts.size > 0 %}
<div class="row">
  <div class="col-12">
    <h3>Recent Posts</h3>
    <ul class="list-unstyled">
      {% for post in site.posts %}
        <li class="mb-3">
          <h5><a href="{{ post.url }}">{{ post.title }}</a></h5>
          <p class="text-muted">
            <small>{{ post.date | date: "%B %d, %Y" }}</small>
          </p>
          {% if post.excerpt %}
            <p>{{ post.excerpt }}</p>
          {% endif %}
        </li>
      {% endfor %}
    </ul>
  </div>
</div>
{% else %}
<div class="row">
  <div class="col-12">
    <div class="alert alert-info" role="alert">
      <h4 class="alert-heading">Blog Coming Soon!</h4>
      <p>I'm currently setting up my blog where I'll share insights about hardware security research, academic experiences, and technical topics.</p>
      <hr>
      <p class="mb-0">Check back soon for new posts!</p>
    </div>
  </div>
</div>
{% endif %}