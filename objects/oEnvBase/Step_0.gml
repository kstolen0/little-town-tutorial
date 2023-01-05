/// @description Insert description here
// You can write your code in this editor

depth = -y;

if (myEmitter != -1 && useSound && audio_is_playing(useSound)) {
  if (instance_exists(oControl)) {
    if (oControl.sequenceState == SequenceState.playing) {
      audio_emitter_gain(myEmitter, 0);
    } else if (audio_emitter_get_gain(myEmitter) < volInit) {
      audio_emitter_gain(myEmitter, volInit);
    }
  }
}
