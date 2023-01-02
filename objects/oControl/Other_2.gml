/// @description Insert description here
// You can write your code in this editor

global.playerControl = true;
enum PlayerState {
  idle,
  walking,
  pickingUp,
  carrying,
  carryIdle,
  puttingDown,
}

enum Facing {
  right,
  up,
  left,
  down,
}

enum ItemState {
  idle,
  taken,
  used,
  puttingBack,
}