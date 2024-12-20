---
layout: default
title: "An oddball from the vault - surprizing joint cinematics"
date: 2024-06-20
categories: projects
image: /assets/images/chute-a-neige-sketchup.png
---

<div style="display: flex; justify-content: center; gap: 20px; flex-wrap: wrap;">
  <div style="flex: 1; text-align: center; max-width: 40%;">
    <img src="{{ '/assets/images/chute-a-neige-sketchup.png' | relative_url }}" 
         alt="ESP32 Project Image" style="width: 100%; height: auto;">
  </div>
  <div style="flex: 1; text-align: center; max-width: 40%;">
    <img src="{{ '/assets/images/chute-a-neige-tikz.png' | relative_url }}" 
         alt="ESP32 Project Image" style="width: 100%; height: auto;">
  </div>
</div>

{% include spacer.html size="3rem" %}

# {{page.title}}

Here is an odd one. Look at that gem! Straight from the vault and now
more than 10 years old.

In preparation for a Master's degree, it appeared like a very good idea
to join a bit of fun to a specific purpose. This funny paper, warts and
all, was about describing a snow blower's chute elevation mechanism. 

The link with robotics will be apparent if you consider the problem of
joint rotation and localisation, even though in this specific case only one
degree of freedom is considered.

The problem to solve was to identify a working configuration, in short
establishing the length of the $h$ link and its pivot mounting point
location $P_2$ before the welder was switched on.

# Why ?

Why oh why, you ask? The shallow answer is easy: two bird's with one stone (two wins in one move,
no birds were harmed...):
 
1. configuring and testing a $\LaTeX$ tool chain for an incoming Master's degree memoir
1. designing a snow blower hydraulic actuated chute in one pass

The first goal was clear and the result is the attached .pdf report. It
looked the part and got me enrolled alright. So, let's call this one
a success!

As for the chute, and looking with envy at the neighbor's machines,
it became clear that the new (to me) snow blower from the 1970's it
came attached to was a bit lacking in features. The chute was fixed
and mounting and dismounting the tractor was not only tedious, but
also dangerous.

The auxiliary hydraulics of my old White 1370 were thus updated with an
electrostatic derivation valve and two functions were now available. The
capacity was about to be interfaced to the snow blower: chute rotation
and elevation.

I had to configure the elevation mechanism and somehow attach it to an
hydraulic actuator. Ideally at the proper location. On the first try.

## Chute rotation

The rotation implementation went fast as a hydraulic cylinder pivoted
an arm from which a cable was attached. That part was found as a used
unit. The cable snugly fit over the chute with a few turns over the
bottom cylinder section.

No real effort was made to plan that part of the design, as the tension
in the cable was adjustable with a turnbuckle while the rotation center
was easily adjusted with a screwed clamp. A few dabs of grease and some
appropriately welded guides and an adjustable finger on top of the frame
of the blower and the chute was rotating smoothly and with good span.
That part was eyeballed and turned out great.

## Chute elevation ... Oops!

The chute elevation required more thoughts. A lot of it. The main issue
was to select the position and length of the linkage $h$, as the movement
of the articulated flap, the one at the tip, could place it in very weird
configurations. Metal bending configurations, that is. Don't ask me why
I know...

# Math, force summation and two surprises!

The trick to solve the problem was to lay out the limbs on a coordinate
frame and write down the force equilibrium equations for both axis. This
yielded a set of parametric equations and the relative movement of the
limbs was properly described with the output angle being described as
a function of the input angle and the various design parameters.

In all humility, here is the resulting paper. It is in french, but the
math should be easy to grasp nonetheless. In all cases, the main takeaways
are summed up following the document.

(Disclaimer: Please note that I am no longer a registered engineer and that my
coordinates have changed since writing this, so you can reach me on my
[LinkedIn](https://linkedin.com/in/francoisperron) instead if you want.)

<div class="pdf-container">
  <a href="{{ site.baseurl }}/assets/docs/EtudeGeometriqueDeflecteur_0v3.pdf" target="_blank">
    <iframe src="{{ site.baseurl }}/assets/docs/EtudeGeometriqueDeflecteur_0v3.pdf" class="pdf-preview" title="PDF Preview"></iframe>
  </a>
</div>

<style>
.pdf-container {
  position: relative;
  display: inline-block;
  overflow: hidden;
  width: 600px; /* Initial width for the preview */
  height: 800px; /* Initial height for the preview */
  transition: width 0.3s ease, height 0.3s ease;
}

.pdf-container:hover {
  width: 800px; /* Enlarged width on hover */
  height: 800px; /* Enlarged height on hover */
}

.pdf-preview {
  width: 100%;
  height: 100%;
  border: none;
}

.pdf-container a {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: block;
}
</style>

{% include spacer.html size="3rem" %}

A parameter space was found and then, as a surprise, the system revealed
a few of its properties.

### Double down

The first surprise was that the output angle was, essentially, the
**double** of the input angle. That's it. That is how you can flip the
snow out of the blower and send it back down without bogging the fan. You
have three surfaces to play with: the fixed chute part that guides the
snow up for the sky, the first mobile flap that bends it to horizontal
(watch it, the windows!), then the last part connected to the member $h$
that doubles the effective angle, sending the snow back down.

So, it came slowly to me that the snow blower had a chute elevator set
with a gain of $6dB$. Yup, that also cracked me up at that time.

### Vise Grips?

Unbeknownst to me, it turned out that the linkage was part of a large
category of machine elements known as a "four bar linkages" with one
degree of freedom. They come with predictable characteristics, they
told me.

Looking at the design space, one can recognize a set of parameters
that can be tested for a Grashof inequality to determine if the
shortest link can rotate freely around its axis. Fascinating! And
for those who are interested in learning more about this, I found
a video that came out after this project and that would have saved
me a lot of time and confusion: [Mechanical Design - Four Bar
Linkage](https://www.youtube.com/watch?v=CZuBeBztzSY)

# Conclusion

<div class="image-stack-wrapper-short">
  <div class="diagonal-stack">
    <img 
      src="{{ '/assets/images/chute-zoom.jpg' | relative_url }}" 
      alt="Zoomed View of Chute" 
      class="stacked-image diagonal-image" 
      onclick="openImage('{{ '/assets/images/chute-zoom.jpg' | relative_url }}')">
    <img 
      src="{{ '/assets/images/chute-hydraulics.jpg' | relative_url }}" 
      alt="Hydraulic Electrostatic Vane" 
      class="stacked-image diagonal-image" 
      onclick="openImage('{{ '/assets/images/chute-hydraulic.jpg' | relative_url }}')">
    <img 
      src="{{ '/assets/images/chute-handle.jpg' | relative_url }}" 
      alt="Lever of Chute" 
      class="stacked-image diagonal-image" 
      onclick="openImage('{{ '/assets/images/chute-handle.jpg' | relative_url }}')">
    <img 
      src="{{ '/assets/images/chute-overall.jpg' | relative_url }}" 
      alt="Overall Snow Blower View" 
      class="stacked-image diagonal-image" 
      onclick="openImage('{{ '/assets/images/chute-overall.jpg' | relative_url }}')">
  </div>
</div>

<script>
  function openImage(url) {
    const imageWindow = window.open();
    imageWindow.document.write(
      `<img src="${url}" style="width: auto; height: auto; display: block; margin: 0 auto;">`
    );
    imageWindow.document.title = "Image Viewer";
  }
</script>

<style>
/* Wrapper for the stack */
.image-stack-wrapper-short {
  float: right;
  width: 50%; /* Adjust as needed */
  margin-left: 10px;
  shape-outside: polygon(0% 0%, 90% 0%, 90% 90%, 0% 90%);
  clip-path: polygon(-10% -10%, 110% -10%, 110% 110%, -10% 110%); /* Larger polygon */
  height: 600px;
}

/* Stacking container */
.diagonal-stack {
  position: relative;
  width: 50%;
  height: auto; /* Dynamically adjust based on stacked images */
}

/* Individual images */
.stacked-image {
  width: 100%; /* Adjust width to fit the container */
  height: auto; /* Maintain aspect ratio */
  border-radius: 5px;
  //box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);
  position: absolute; /* Allows for diagonal positioning */
  transition: transform 0.2s ease-in-out, z-index 0.2s ease-in-out;
}

/* Positioning each image diagonally */
.diagonal-image:nth-child(1) {
  top: 0px;
  left: 0px;
  z-index: 4;
}
.diagonal-image:nth-child(2) {
  top: 50px; /* Slight downward offset */
  left: 30px; /* Slight rightward offset */
  z-index: 3;
}
.diagonal-image:nth-child(3) {
  top: 100px;
  left: 60px;
  z-index: 2;
}
.diagonal-image:nth-child(4) {
  top: 150px;
  left: 90px;
  z-index: 1;
}

/* Hover effect for zoom and focus */
.stacked-image:hover {
  transform: scale(1.05);
  z-index: 5; /* Bring hovered image to the front */
}
</style>

So I now recognize that the thing to avoid was a Grashof Inversion. The
kicker is that this is exactly what you would want for your pair of Vise
Grip pliers! Not so much for your blower.

In all applicability, after finding a geometry that made sense with the
actual chute that I already had, all was left what to ensure that the
selected $h$ and $P_2$ would prevent the kink angle between $g$ and $h$
to reverse, sending the last flap in the air and the operator in a state
of surprise ;-)

The tractor was used a lot with the implemented device. One day I
might stumble upon a video of it in operation and decide to post it
here. Meanwhile, here are a few photos of the setup. Please don't mind
the color palette too much, this was meant to be a work horse on the farm,
not a show winner ;-)


Don't forget to <a href="javascript:;"
onclick="tidioChatApi.display(true);tidioChatApi.open()">subscribe in
the chat</a> and comeback soon!
