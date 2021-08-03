
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
  [20 , 1] // flying
];

const spritesBugs = [
  [
    Offset(96, 80),
    Offset(208, 80),
    Offset(320, 80),
    Offset(432, 80),
  ], // walk
  [
    Offset(96, 64),
    Offset(208, 64),
  ], // fly
];
