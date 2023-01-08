/// @description Insert description here
// You can write your code in this editor

if (!sequenceToShow) {
  global.playerControl = true;
}

if (sequenceToShow) {
  scrPlaySequence(sequenceToShow);
}

instance_destroy();
