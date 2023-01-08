// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrPlaySequence(_sequenceToPlay) {
  var _camX = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0])*0.5);
  var _camY = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0])*0.5);

  if (instance_exists(oControl) && 
  !layer_sequence_exists(oControl.currentSequenceLayer, _sequenceToPlay)) {
    if (layer_exists(oControl.currentSequenceLayer)) {
      layer_sequence_create(oControl.currentSequenceLayer, _camX, _camY, _sequenceToPlay);
      layer_depth(oControl.currentSequenceLayer, -10000);
    }
  }
}