---
layout: default
title: "esp32 port: better flow and temp sensors"
date: 2024-06-17
categories: projects
image: /assets/images/project1.jpg
---


<div style="display: flex; justify-content: center; gap: 20px; flex-wrap: wrap;">
  <div style="flex: 1; text-align: center; max-width: 40%;">
    <img src="{{ '/assets/images/project1-dalle.webp' | relative_url }}" 
         alt="ESP32 Project Image" style="width: 100%; height: auto;">
  </div>
  <div style="flex: 1; text-align: center; max-width: 40%;">
    <img src="{{ '/assets/images/project1b.webp' | relative_url }}" 
         alt="ESP32 Project Image" style="width: 100%; height: auto;">
  </div>
</div>
{% include small-text.html content="Being in 2024, I could not resist
asking Dall-E to help me with the visuals." %}

{% include spacer.html size="3rem" %}

# {{page.title}}

Here is a recent one.

Projects come in all sizes and shapes. Sometimes it takes one weird turn
and you are sent back to square one, right at the architecture phase.

For this one, a few smells were already evident from the start, but the
project got along and we moved on. A few ideas came back at me and I
decided to take a few hours to revisit the concept and fix the thing.

So here is the rebirth of a project that exposes sensors and actuators
on the net while properly keeping track of devices and versions. Think
of this as the proverbial "full stack" development endeavor, but with
a few twists. In particular, no database was harmed in the process ;-)

Bonus points: I got to revisit C++ strategies that I did not have to
implement in the recent past, so this came as a wonderful refresher.

## The goal

The timeframe for this one was very limited. This refactoring project
was running in parallel with the design of an FPGA interface to an hdmi
display project. Almost as if it was a mule or a testbed.

So the goal remained simple: re-implement an access mechanism to 2 flow
sensors and 4 one-wire temperature sensors, while maintaining a proper
communication channel with a backend interface and live data updates to
an FPGA driven display.

So, in essence, this projet became a shim layer between a backend in
python/fastapi and firmware in a FPGA.

## Features:

The refactor had to:

- Implement the full resolution from an arbitrary number of digital temperature probes
- Measure 2 liquid flows with constant minimal resolution
- Maintain a very clear identification of: any connected device, its build id and api version
- Free-up sufficient computing power to maintain a PID loop in function with very smooth operation

