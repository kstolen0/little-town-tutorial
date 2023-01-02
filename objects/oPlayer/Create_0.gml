/// @description Insert description here
// You can write your code in this editor

state = PlayerState.idle;

function addSpritesForState(_state, sprites) {
  playerSpr[_state][Facing.right] = sprites.right;
  playerSpr[_state][Facing.up] = sprites.up;
  playerSpr[_state][Facing.left] = sprites.left;
  playerSpr[_state][Facing.down] = sprites.down;
}

function setupPlayerSprites() {
  // idle
  idleSprites = {
    right: sPlayerIdleRight,
    up: sPlayerIdleUp,
    left: sPlayerIdleLeft,
    down: sPlayerIdleDown,
  };  
  addSpritesForState(PlayerState.idle, idleSprites);

  // walking
  walkingSprites = {
    right: sPlayerWalkRight,
    left: sPlayerWalkLeft,
    up: sPlayerWalkUp,
    down: sPlayerWalkDown,
  };
  addSpritesForState(PlayerState.walking, walkingSprites);
  
  // picking up
  pickupSprites = {
    right: sPickupRight,
    left: sPickupLeft,
    up: sPickupUp,
    down: sPickupDown,
  }
  addSpritesForState(PlayerState.pickingUp, pickupSprites);
  
  // putting down
  putDownSprites = {
    right: sPutDownRight,
    left: sPutDownLeft,
    up: sPutDownUp,
    down: sPutDownDown,
  }
  addSpritesForState(PlayerState.puttingDown, putDownSprites);
  
  // carry
  carrySprites = {
    right: sCarryRight,
    left: sCarryLeft,
    up: sCarryUp,
    down: sCarryDown,
  }
  addSpritesForState(PlayerState.carrying, carrySprites);
  
  // carry idle sprites
  carryIdleSprites = {
    right: sCarryIdleRight,
    left: sCarryIdleLeft,
    up: sCarryIdleUp,
    down: sCarryIdleDown,
  }
  addSpritesForState(PlayerState.carryIdle, carryIdleSprites); 
}

setupPlayerSprites();


walkSpeed = 8;
vx = 0;
vy = 0;
dir = 3;
moveRight = 0;
moveLeft = 0;
moveUp = 0;
moveDown = 0;
nearbyNPC = noone;
npcPrompt = noone;
lookRange = 120;
hasGreeted = false;

hasItem = noone;
hasItemX = x;
hasItemY = y;
nearbyItem = noone;
itemPrompt = noone;
carryLimit = 0;
runSpeed = 0;
runMax = 6;
running = false;

startDust = 0;

audio_listener_set_position(0,x,y,0);
audio_listener_set_orientation(0,0,1,0,0,0,1);