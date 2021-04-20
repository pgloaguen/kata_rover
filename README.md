# KATA: mars rover
The kata can be found at https://kata-log.rocks/mars-rover-kata

## Goal
The goal was to make the kata with TDD and dart.

## Results
All classes are fully tested except the Painter class wich is tied to the Console package

- *Orientation* reprensents the 4 possibles orientation
- *Vector* represents the mathematical orientation of the *Rover*
- *Position* represents a point on the *Plan*
- *Plan* represents the map with their bounds and obstacles and take the responsability to locate the *Rover*
- *Command* represents the action known by the *Rover*
- Rover represent the robot which land on the *Plan*. It executes the command received and use the Plan to locate itself
- *Pen* is responsible to draw the *Plan* and the *Rover*
- *Painter* is responsible to draw the *Plan* and the *Rover* in the terminal


