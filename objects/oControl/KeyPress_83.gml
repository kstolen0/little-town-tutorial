/// @description Insert description here
// You can write your code in this editor

var _camX = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0])*0.5);
var _camY = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0])*0.5);

if (!layer_sequence_exists(currentSequenceLayer, seqBakerHappy)) {
  if (layer_exists(currentSequenceLayer)) {
    layer_sequence_create(currentSequenceLayer, _camX, _camY, seqBakerHappy);
    layer_depth(currentSequenceLayer, -10000);
  }
}
