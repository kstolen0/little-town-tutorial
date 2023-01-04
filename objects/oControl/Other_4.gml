/// @description Insert description here
// You can write your code in this editor

switch (room) {
  case rmGameMain: {
    audio_play_sound(snd_townBGM,1,1);
    audio_play_sound(snd_townAmbience,1,1);
    break;
  }
}

if (layer_exists("Cutscenes")) {
  currentSequenceLayer = "Cutscenes";
} else {
  currentSequenceLayer = "Instances";
}