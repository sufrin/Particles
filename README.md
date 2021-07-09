# Particles
## Particle motion simulation using ThreadCSO

Simple example of a hybrid concurrent implementation using 
[ThreadCSO](https://github.com/sufrin/ThreadCSO)
barriers, semaphores, and channels.


A demonstration of pseudo-gravitational particle calculations done by several workers
in lock-step, coordinated by barriers, with (many) parameters of the simulation
settable from the GUI.  
  
  1. The particles move in a closed container with energy absorbent
  walls. 

  1. There is an upper bound on the speed to which they can accelerate

  1. Clicking on a particle increases its density by an order of
  magnitude (and changes its hue "redward". The mass of a particle
  is calculated in the usual way from its radius, viz:
  density×(4/3)πR&#x00B3;
  
  1. Control-clicking on a particle  decreases its density by an order of magnitude.
  
  1. One or more particles can be selected (or deselected) by Command-cllicking. Selected
  particles can be nudged, when the simulation is not running, by using the direction keys
  on the keyboard. 
  
  1. Coefficients of restitution of walls and particles can be set
  interactively or as the application begins.

  1. δt is the simulated elapsed time between computed frames

  1. FPS is the (target) number of frames to be shown per elapsed
  second of real time This is really here to test the efficiency
  of our scala code, and under some circumstances it may not be
  reached; but this doesn't damage the simulation.

  1. The number of particles is the product of P (the number of
  worker processes), and 2×S (the number of particles managed per
  worker process).

Make the jar file from the shell with `make` (make sure you have
set up the `make.properties` file properly with the class path of
the threadcso library, etc.)

Usage is `scala -cp "ap't classpath" Particles` [*args*], where each *arg* is one of

  - S «S: int» (default 1) each worker manages 2xS particles
  - P «P: int» (default 4) number of worker processes
  - t «∂t: double» (default 3.0) time quantum for simulation
  - s «scale: int» (default -11) order of magnitude of 'gravitational' constant: G = 6.79E<scale>
  - W «Wall: double» (default 0.9) When it hits a wall a particle's momentum *= -Wall.
  - B «Ball: double» (default 1.0) force multiplier for touching particles [negative => repulsion]
  - FPS «FPS: int» (600) frames to be shown per second (target value)
  - w=«int» (800) width of the arena (units)
  - h=«int» (700) height of the arena (units)
  - C «CF: double» (16.0) particle speed is limited to |(width/CF∂t, height/CF∂t)|.
  - -d enable the debugger (false)
  - `--` Remaining parameters are particle specs of the form `<radius>@<x>,<y>`. If none are given, then 2×P×S are made at random.

For example `scala -cp ~/local/lib/threadcso.jar:Particles.jar Particles`

BE SURE TO TICK THE `Run` box when the display comes up: it is used to start and stop the simulation. 

  
  Bernard Sufrin, Oxford, 2011 and 2017


