/// @description Insert description here
// You can write your code in this editor

function fadeIn() {
  if (image_alpha < 1) {
    image_alpha += fadeSpeed;
  }
  
  if (image_alpha >= 1) {
    fadeMe = "fadeVisible";
  }
}

function fadeOut() {
  if (image_alpha > 0) {
    image_alpha -= fadeSpeed;
  }
  if (image_alpha <= 0) {
    fadeMe = "fadeDone";
    alarm[0] = 2;
  }
}

function bob() {
  y += shift;
}

switch (fadeMe) {
  case "fadeIn": {
    fadeIn();
    break;
  }
  case "fadeOut": {
    fadeOut();
    break;
  }
}

bob();
