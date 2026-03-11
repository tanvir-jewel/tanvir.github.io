---
layout: blog
title: Blog
permalink: /blog/
description: "Blog posts by Tanvir Hossain on hardware security, research insights, and academic life."
keywords: "hardware security blog, research blog, PhD student blog, microelectronics"
jumbo_txt: |
  Thoughts on hardware security, research insights, and my journey as a PhD researcher.
---

{% assign technical_posts = site.posts | where: "type", "technical" %}
{% assign reflections_posts = site.posts | where: "type", "reflections" %}

<!-- Tab navigation -->
<ul class="nav nav-tabs mb-4" id="blogTabs" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="technical-tab" data-toggle="tab" href="#technical" role="tab">
      <i class="fas fa-microchip mr-1"></i> Technical Notes
      {% if technical_posts.size > 0 %}
        <span class="badge badge-primary ml-1">{{ technical_posts.size }}</span>
      {% endif %}
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="reflections-tab" data-toggle="tab" href="#reflections" role="tab">
      <i class="fas fa-feather-alt mr-1"></i> Reflections
      {% if reflections_posts.size > 0 %}
        <span class="badge badge-secondary ml-1">{{ reflections_posts.size }}</span>
      {% endif %}
    </a>
  </li>
</ul>

<div class="tab-content" id="blogTabContent">

  <!-- Technical Notes tab -->
  <div class="tab-pane fade show active" id="technical" role="tabpanel">
    <p class="text-muted mb-4">Deep dives into hardware security, tutorials, and research notes.</p>
    {% if technical_posts.size > 0 %}
      <ul class="list-unstyled">
        {% for post in technical_posts %}
          <li class="mb-4">
            <h5><a href="{{ post.url }}">{{ post.title }}</a></h5>
            <p class="text-muted mb-1">
              <small><i class="fas fa-calendar-alt mr-1"></i>{{ post.date | date: "%B %d, %Y" }}</small>
            </p>
            {% if post.excerpt %}
              <p class="mb-0">{{ post.excerpt }}</p>
            {% endif %}
          </li>
        {% endfor %}
      </ul>
    {% else %}
      <div class="alert alert-light border" role="alert">
        <i class="fas fa-pen-nib mr-2 text-muted"></i>No technical posts yet — check back soon.
      </div>
    {% endif %}
  </div>

  <!-- Reflections tab -->
  <div class="tab-pane fade" id="reflections" role="tabpanel">
    <p class="text-muted mb-4">Personal essays, observations, and thoughts beyond the research lab.</p>
    {% if reflections_posts.size > 0 %}
      <ul class="list-unstyled">
        {% for post in reflections_posts %}
          <li class="mb-4">
            <h5><a href="{{ post.url }}">{{ post.title }}</a></h5>
            <p class="text-muted mb-1">
              <small><i class="fas fa-calendar-alt mr-1"></i>{{ post.date | date: "%B %d, %Y" }}</small>
            </p>
            {% if post.excerpt %}
              <p class="mb-0">{{ post.excerpt }}</p>
            {% endif %}
          </li>
        {% endfor %}
      </ul>
    {% else %}
      <div class="alert alert-light border" role="alert">
        <i class="fas fa-feather-alt mr-2 text-muted"></i>No reflections yet — coming soon.
      </div>
    {% endif %}
  </div>

</div>
