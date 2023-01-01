/// @description Insert description here
// You can write your code in this editor

event_inherited();


function detectMovement() {   
  if (global.playerControl) {
    moveRight = keyboard_check(vk_right);
    moveLeft = keyboard_check(vk_left);
    moveUp = keyboard_check(vk_up);
    moveDown = keyboard_check(vk_down);
    return; 
  }
  
  moveRight = 0;
  moveLeft = 0;
  moveUp = 0;
  moveDown = 0;
}


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

function isWithinRange(type, notMe) {
  return collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange, type, false, notMe);
}

function lookForNPCs() {
  nearbyNPC = isWithinRange(oNpcBase, true);
  
  if (!nearbyNPC) {
    hasGreeted = false;
    scrDismissPrompt(npcPrompt, 0);
    return;
  }
  
  if (!hasGreeted && !audio_is_playing(snd_greeting01)) {
    audio_play_sound(snd_greeting01,1,0);
    hasGreeted = true;
  }
  
  if (!npcPrompt) {
    npcPrompt = scrShowPrompt(nearbyNPC, nearbyNPC.x, nearbyNPC.y-450);
  }
}

function lookForItems() {
  nearbyItem = isWithinRange(oItemBase, false);

  if (!nearbyItem) {
    scrDismissPrompt(itemPrompt,1);
    return;
  }
  
  if(!itemPrompt) {
    itemPrompt = scrShowPrompt(nearbyItem, nearbyItem.x, nearbyItem.y - (nearbyItem.sprite_height*3));
  }
}

detectMovement();
movePlayer();
updateSprites();
lookForNPCs();
lookForItems();