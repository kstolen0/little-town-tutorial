/// @description Insert description here
// You can write your code in this editor

switch (event_data[? "message"]) {
  case "sequenceStart": {
    sequenceState = SequenceState.playing;
    if (layer_get_element_type(event_data[? "element_id"]) == layerelementtype_sequence)  {
      currentSequence = event_data[? "element_id"];  
    }
    break;
  }
  case "sequenceEnd": {
    sequenceState = SequenceState.finished;
    break;
  }
}
