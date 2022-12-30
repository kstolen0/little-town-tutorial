/// @description Insert description here
// You can write your code in this editor

event_inherited();

moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveUp = keyboard_check(vk_up);
moveDown = keyboard_check(vk_down);

function movePlayer() {
  vx = (moveRight - moveLeft) * walkSpeed;
  vy = (moveDown - moveUp) * walkSpeed;

  if (!collision_point(x+vx, y, oEnvBase, true, true)) {
    x += vx;
  }

  if (!collision_point(x, y+vy, oEnvBase, true, true)) {
    y += vy;
  }
  
  audio_listener_set_position(0,x,y,0);
}

function updateSprites() {
  switch dir {
    case 0: sprite_index = sPlayerIdleRight; break;
    case 1: sprite_index = sPlayerIdleUp; break;
    case 2: sprite_index = sPlayerIdleLeft; break;
    default: sprite_index = sPlayerIdleDown;
  }

  if (moveDown) {
    sprite_index = sPlayerWalkDown;
    dir = 3;
  }

  if (moveUp) {
    sprite_index = sPlayerWalkUp;
    dir = 1
  }

  if (moveRight) {
    sprite_index = sPlayerWalkRight;
    dir = 0;
  }

  if (moveLeft) {
    sprite_index = sPlayerWalkLeft;
    dir = 2;
  }
}

function lookForNPCs() {
  nearbyNPC = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, oNpcBase, false, true);
  
  if (!nearbyNPC) {
    hasGreeted = false;
    return;
  }
  
  if (!hasGreeted && !audio_is_playing(snd_greeting01)) {
    audio_play_sound(snd_greeting01,1,0);
    hasGreeted = true;
  }
}
    
movePlayer();
updateSprites();
lookForNPCs();
