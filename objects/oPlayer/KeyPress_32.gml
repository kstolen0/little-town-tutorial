/// @description Insert description here
// You can write your code in this editor

if (nearbyNPC && global.playerControl) {
  global.playerControl = false;
  _text = nearbyNPC.myText;
  if (!instance_exists(oTextbox)) {
    var _textBox = instance_create_depth(nearbyNPC.x - 300, nearbyNPC.y - 400, -10000, oTextbox);
    
    _textBox.textToShow = _text;
  }
}

