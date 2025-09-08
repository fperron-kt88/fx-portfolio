---
layout: default
title: "Sonic wind speed sensors"
date: 2025-08-21
categories: projects
image: /assets/images/xxx
---

<div style="display: flex; justify-content: center; gap: 20px; flex-wrap:
wrap;">
  <div style="flex: 1; text-align: center; max-width: 40%;">
    <img src="{{ '/assets/images/project1-dalle.webp' | relative_url }}"
         alt="Motionless Anemometer Image" style="width: 100%; height:
         auto;">
  </div>
</div> {% include small-text.html content="The basic measurment aparatus
concept, ChatGPT 5 style." %}

{% include spacer.html size="3rem" %}

# {{page.title}}

I like wind. A lot.

I like reliable systems. Less than I like wind, but I like when crafted
objects made for a purpose keep performing their purpose. So that I can
enjoy the wind. A lot.

Which brings me to anemometers. Moving parts in the salty spray. Gale
winds on one day, cooking in the sun the next. Freezing rain, hail, birds,
what have you... They just work. It happens that the problem of measuring
wind force and direction is solved generally. Folks use mast anemometers
with moving parts all day long and a brief look at any given marina will
prove it. They are there proudly hiking at the top of every mast. Almost
all the same. Mechanical girouettes or wind vanes, then rotating cups. It
just works. Many of these for 10's of years and maybe more.

### The problem

There is no problem. Anemometers work.

But I am curious about an alternative. Without moving parts, so they
could survive in the wild without being isolated on top of a 25ft+
mast. Could they be buildable for cheap enough that they could be spread
in quantity to map the wind patterns at a kite spot? Maybe we could
extend the measuring field to characterize gusts, thermals and could
anticipate the wind 5 or 10 minutes from now if spread properly?

Wind predictions have evolved a lot, but most often times, the validation
data (the white thick "actual") is measured kilometers away or is just
downright missing half the time.

### Alternatives

Cars measure air volume using MAF (Mass Air Flow) or MAP (Mass Air
Pressure), some using a hot wire or a flap. These also work. Flaps move,
pressure methods require funelling/directivity, they are out. Hot wire
is fine (I have been told), and are very sensitive in the low range,
but this method requires energy orders of magnitude more than strictly
available remotely for an unattended radio beacon...

What I am curious about is the sonic anemometers. They use time of
flight between ultrasonic sensors to measure wind speed, and, placed in
an orthogonal arrangement, will also measure wind direction.

I have seen devices at 90\\$CAD the size of a fist. Some a little pricier
(around 600\\$CAD). Some are certified to IP66, but the price is "Call
for pricing".

### The goal

I want a real-time measurement at many of my prefered kiteboarding sites
to map the accuracy of the models against a known measurement.

This means that sensors will be knocked off and tampered with and will
have to be replaced. The more rugged they are the better, the less
intrusive or "interesting" they are, the longer they will survive in
the wild.

For that, I need cheap sensors churning live data in a network.

### Working principle

The sensor uses acoustic sonar waves sent on a path where they interract
with the ambiant air. Since the air is moving as a medium for the sound,
the time of flight of the sonar impulse will be dictated, in large part,
by the speed of sound in this specific medium.

Now, depending on the wind direction, the time of flight will be shortened
if the wind is in the same direction, a tail wind scenario, or it will
be lenghtened if the pulse fights against it, a head wind.

In practice and at the scale of 10cm, the time of flight is short (les
than a millisecond), so multiple measurements can be made in these two
directions to get a reliable figure for both. With these time of flight
measurements, we can either extract a measurement of the actual wind
velocity or the medium speed itself.

To express in equations, let's consider a pair of transducer facing
along a segment of length $L$. We have, at each end, point $A$ and
point $B$. Let's call $t_{AB}$ the direct time of flight and $t_{BA}$
the reverse time of flight. The sensors are ideal point sources and
sinks and totally reversible in their operations.

In equation format, we have $c$ the speed of sound at that temperature
and humidity for still air, $v_{path}$ the desired wind speed component
along the path $L$.

$$
\begin{equation}
\begin{aligned}
v_{path} &= \frac{L}{2} \cdot \left( \frac{1}{t_{AB}} - \frac{1}{t_{BA}} \right) \\
c &= \frac{L}{2} \cdot \left( \frac{1}{t_{AB}} - \frac{1}{t_{BA}} \right)
\end{aligned}
\end{equation}
$$

In practice, computing $c$ is not required, but it could be used as
a base for internal validation of the wind speed measurement, as it
is possible to infer a sonic temperature from that sound velocity and
compare to an independant one.

Also, the actual transducer arrangement is often implemented with a
$45^\circ$ azimut mounting and a top plate reflecting the sonic waves
between them. This gives a natural $\sqrt{2}$ length gain for the flight
path in the same volume, it somewhat protects the transducers from the
elements, reduces the sensitivity of the sensor to vertical components
of the wind and also favors a larger portion of the time of flight in
undisturbed air.

Mounting 4 transducers in an orthogonal arrangement gives components
in both $x$ and $y$ directions, yielding a full $360\circ$ sensitivity
pattern if the mounting brackets are slim compared to the device. Their
effect on the measurements can also be characterised and compensated.
