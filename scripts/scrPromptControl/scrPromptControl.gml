// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrShowPrompt(_object, _x, _y) {
  if (instance_exists(_object)) {
    if (!instance_exists(oTextbox) && !instance_exists(oPrompt)) {
      return instance_create_depth(_x, _y, -9999, oPrompt);
    }
  }
}

function scrDismissPrompt(_prompt, _reset) {
  
  if (instance_exists(_prompt)) {
    with (_prompt) {
      fadeMe = "fadeOut";
    }
    
    if (instance_exists(oPlayer)) {
      with (oPlayer) {
        switch _reset {
          case 0: npcPrompt = noone;
          case 1: itemPrompt = noone;
        }
      }
    }
  }
}