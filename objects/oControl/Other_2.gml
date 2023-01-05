/// @description Insert description here
// You can write your code in this editor

global.playerControl = true;
global.gameOver = false;
global.gameStart = false;

townBGVolume = audio_sound_get_gain(snd_townBGM);
townAmbienceVolume = audio_sound_get_gain(snd_townAmbience);

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

enum SequenceState {
  notPlaying,
  waiting,
  playing,
  finished,
}

sequenceState = SequenceState.notPlaying;
currentSequenceLayer = noone;
currentSequence = noone;