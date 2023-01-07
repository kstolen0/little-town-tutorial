/// @description Insert description here
// You can write your code in this editor

if (!sequenceToShow) {
  global.playerControl = true;
}

if (sequenceToShow) {
  var _camX = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0])*0.5);
  var _camY = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0])*0.5);

  if (instance_exists(oControl) && 
  !layer_sequence_exists(oControl.currentSequenceLayer, sequenceToShow)) {
    if (layer_exists(oControl.currentSequenceLayer)) {
      layer_sequence_create(oControl.currentSequenceLayer, _camX, _camY, sequenceToShow);
      layer_depth(oControl.currentSequenceLayer, -10000);
    }
  }
}

instance_destroy();
