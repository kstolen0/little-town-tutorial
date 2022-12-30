/// @description Insert description here
// You can write your code in this editor
function fadeIn() { 
  if (image_alpha < 1) {
    image_alpha += fadeSpeed;
  }
  
  fadeMe = floor(image_alpha);
}

function fadeOut() {
  if (image_alpha > 0) {
    image_alpha -= fadeSpeed;
  }
  if (image_alpha == 0) {
      fadeMe = 3;
      alarm[0] = 2;
    }
}

switch fadeMe {
  case 0: {
    fadeIn();
    break;
  }
  case 2: {
    fadeOut();
    break;
  }
}
