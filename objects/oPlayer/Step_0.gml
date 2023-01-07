/// @description Insert description here
// You can write your code in this editor

event_inherited();

function setDirection() { 
  if (moveDown) {
    dir = Facing.down;
  }

  if (moveUp) {
    dir = Facing.up
  }

  if (moveRight) {
    dir = Facing.right;
  }

  if (moveLeft) {
    dir = Facing.left;
  }
}

function detectMovement() {
    
  if (global.playerControl) {
    moveRight = keyboard_check(vk_right);
    moveLeft = keyboard_check(vk_left);
    moveUp = keyboard_check(vk_up);
    moveDown = keyboard_check(vk_down);
    running = keyboard_check(vk_shift);
    
    setDirection();
    
    return; 
  }
  
  moveRight = 0;
  moveLeft = 0;
  moveUp = 0;
  moveDown = 0;
}

function updatePlayerState() {
  
  if (state == PlayerState.pickingUp) {
    if (image_index >= image_number - 1) {
      state = PlayerState.carrying;
      global.playerControl = true;
    }
    return;
  }
  
  if (state == PlayerState.puttingDown) {
    if (image_index >= image_number - 1) {
      state = PlayerState.idle;
      global.playerControl = true;
    }
    return;
  }

  if (vx != 0 || vy != 0) {    
    state = hasItem ? PlayerState.carrying : PlayerState.walking;
    return;
  }
  
  state = hasItem ? PlayerState.carryIdle : PlayerState.idle;
}

function createDust() {
  if (running) {
    if (!startDust) {
      startDust = 1;
      alarm[0] = 2;
    }    
    
    return;
  }
  
  startDust = 0;  
}

function setListener() {
  if (instance_exists(oControl) && oControl.sequenceState == SequenceState.playing) {
    var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5);
    var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5);
    audio_listener_set_position(0,_camX,_camY,0);
    
    return;
  }
  
  audio_listener_set_position(0,x,y,0);
}

function movePlayer() {
  if (running && runSpeed < runMax) {
    runSpeed += 1;
  } else if (runSpeed > 0) {
    runSpeed -= 1;
  }
  
  createDust();
  
  vx = (moveRight - moveLeft) * (walkSpeed+runSpeed) * (1-carryLimit);
  vy = (moveDown - moveUp) * (walkSpeed+runSpeed) * (1-carryLimit);

  if (!collision_point(x+vx, y, oEnvBase, true, true)) {
    x += vx;
  }

  if (!collision_point(x, y+vy, oEnvBase, true, true)) {
    y += vy;
  }
  
  updatePlayerState();
  
  setListener();
}

function updateSprites() {
  
  sprite_index = playerSpr[state][dir];
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
  if (hasItem) {
    nearbyItem = noone;
    return;
  }
  
  nearbyItem = isWithinRange(oItemBase, false);

  if (!nearbyItem || nearbyNPC) {
    scrDismissPrompt(itemPrompt,1);
    return;
  }
  
  if (!itemPrompt && !hasItem) {
    itemPrompt = scrShowPrompt(nearbyItem, nearbyItem.x, nearbyItem.y - (nearbyItem.sprite_height*3));
  }
}

detectMovement();
movePlayer();
updateSprites();
lookForNPCs();
lookForItems();