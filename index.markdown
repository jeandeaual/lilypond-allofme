---
layout: default
---

{% assign a4_files = site.static_files | where: "a4", true | where: "extname", ".pdf" | sort: "basename" %}
{% assign letter_files = site.static_files | where: "letter", true | where: "extname", ".pdf" | sort: "basename" %}
{% assign svg_files = site.static_files | where: "svg", true | where: "extname", ".svg" | sort: "basename" %}
{% assign midi_files = site.static_files | where: "midi", true | where: "extname", ".midi" | sort: "basename" %}

# Downloads

{% if a4_files != empty %}
## A4
{% for file in a4_files %}
* [{{ file.name }}]({{ file.path | relative_url }})
{% endfor %}
{% endif %}

{% if letter_files != empty %}
## Letter
{% for file in letter_files %}
* [{{ file.name }}]({{ file.path | relative_url }})
{% endfor %}
{% endif %}

{% if midi_files != empty %}
## MIDI
{% for file in midi_files %}
* [{{ file.name }}]({{ file.path | relative_url }})
{% endfor %}
{% endif %}

{% if svg_files != empty %}
# Preview
{% for file in svg_files %}
![{{ file.basename }}]({{ file.path | relative_url }})
{% endfor %}
{% endif %}

Last update on {{ site.time | date: "%Y-%m-%d %H:%M UTC" }}.
