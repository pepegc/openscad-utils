# openscad-utils

Several utilies files for [OpenSCAD](http://www.openscad.org/).

## Getting Started

To use them, just `<include>` the utilities you need in your project files and you will be set to go. For example:
```
include <path/Geometry.scad>
getVec([0, 1, 2], [1, 1, 1]); //returns [1, 0, -1]
```

## Utilities

### Geometry.scad

Contains a number of functions to find angles, distances, vectors, and other linear algebra elements. 

### Patterns.scad

Allows linear, quadratic, and cubic patterns in a cartesian system of coordinates.
Allows circular and cylindrical patterns in a polar system of coordinates.

### String.scad

Functions for handling Strings.

### Holes.scad

Easily make holes for countersunk or counterbored screws. Select between different fits.
**Under construction.**

### Bearing.scad

Easy bearing.

