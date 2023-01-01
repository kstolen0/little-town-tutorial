/// @description Insert description here
// You can write your code in this editor

state = PlayerState.idle;

// idle
playerSpr[PlayerState.idle][Facing.right] = sPlayerIdleRight;
playerSpr[PlayerState.idle][Facing.up] = sPlayerIdleUp;
playerSpr[PlayerState.idle][Facing.left] = sPlayerIdleLeft;
playerSpr[PlayerState.idle][Facing.down] = sPlayerIdleDown;

// walking
playerSpr[PlayerState.walking][Facing.right] = sPlayerWalkRight;
playerSpr[PlayerState.walking][Facing.up] = sPlayerWalkUp;
playerSpr[PlayerState.walking][Facing.left] = sPlayerWalkLeft;
playerSpr[PlayerState.walking][Facing.down] = sPlayerWalkDown;

walkSpeed = 16;
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

audio_listener_set_position(0,x,y,0);
audio_listener_set_orientation(0,0,1,0,0,0,1);