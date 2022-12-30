/// @description Insert description here
// You can write your code in this editor

event_inherited();

var isLastFrame = function() {
  return image_index == image_number-1
}

if (image_speed > 0 && isLastFrame()) {
  image_speed = 0;
  alarm[0] = irandom_range(loopRange01, loopRange02);
}
