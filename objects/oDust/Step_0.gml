/// @description Insert description here
// You can write your code in this editor

image_angle += rotSpeed;
y -= driftSpeed;

if (image_alpha > 0) {
  image_alpha -= fadeSpeed;
} else {
  instance_destroy();
}

