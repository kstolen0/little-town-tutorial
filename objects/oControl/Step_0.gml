/// @description Insert description here
// You can write your code in this editor

function fadeOutAudio(audio) {
  if (audio_is_playing(audio)) {
      audio_sound_gain(audio, 0, 60);
    }
}

function fadeInAudio(audio, maxVolume) {
  if (audio_is_playing(audio)) {
    audio_sound_gain(audio, maxVolume, 60);
  }
}

function isGameOver() {
  if (!global.gameOver) {
    if (instance_exists(oNpcBaker) && instance_exists(oTeacher) && instance_exists(oGrocer)) {
      if (oNpcBaker.state == NPCState.done &&  oGrocer.state = NPCState.done && oTeacher.state == NPCState.done) {
        global.playerControl = false;
        alarm[0] = 60;
        global.gameOver = true;
      }
    }
  }
}

switch sequenceState {
  case SequenceState.playing: {
    fadeOutAudio(snd_townBGM);
    fadeOutAudio(snd_townAmbience);
    global.playerControl = false;
    break;
  }
  case SequenceState.finished: {
    if (layer_sequence_exists(currentSequenceLayer, currentSequence)) {
      layer_sequence_destroy(currentSequence);
      currentSequence = noone;
    }
    
    fadeInAudio(snd_townBGM, townBGVolume);
    fadeInAudio(snd_townAmbience, townAmbienceVolume);
    
    global.playerControl = true;
    sequenceState = SequenceState.notPlaying;
    isGameOver();
    break;
  }
}
