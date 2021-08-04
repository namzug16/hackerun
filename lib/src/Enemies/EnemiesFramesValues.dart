
// * Firewall

import 'dart:ui';

const framesValuesFirewall = [
  [15, 1]
];

const spritesFirewall = [
  [
    Offset(16, 240),
    Offset(128, 240),
    Offset(240, 240),
    Offset(352, 240),
  ], // lvl1 height 48
  [
    Offset(48, 208),
    Offset(160, 208),
    Offset(272, 208),
    Offset(384, 208),
  ], // lvl2 height 96
];

// * Bugs

const framesValuesBugs = [
  [15 , 1], // ground
  [15 , 1] // flying
];

const spritesBugs = [
  [
    Offset(80, 64),
    Offset(192, 64),
    Offset(304, 64),
    Offset(416, 64),
  ], // walk
  [
    Offset(80, 48),
    Offset(192, 48),
  ], // fly
];
