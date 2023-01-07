/// @description Insert description here
// You can write your code in this editor

event_inherited();

var isLastFrame = function() {
  return image_index == image_number-1
}

switch state {
  case NPCState.normal: {
    if (image_speed > 0 && isLastFrame()) {
      image_speed = 0;
      alarm[0] = irandom_range(loopRange01, loopRange02);
    } 
    break;
  }
  case NPCState.done: {
    if (doneSprite && sprite_index != doneSprite) {
      sprite_index = doneSprite;
    }
    break;
  }
}