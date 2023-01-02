// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrItemPosition() {
  var _x, _y, _depth;
  if (instance_exists(oPlayer)) {
    _infront = oPlayer.depth-20;
    _behind = oPlayer.depth+20;
    
    switch oPlayer.dir {
      case Facing.right: {
        _x = oPlayer.x+65;
        _y = oPlayer.y-112;
        _depth = _infront;
        break;
      }
      case Facing.up: {
        _x = oPlayer.x;
        _y = oPlayer.y-95;
        _depth = _behind;
        break;
      }
      case Facing.left: {
        _x = oPlayer.x-65;
        _y = oPlayer.y-112;
        _depth = _infront;
        break;
      }
      case Facing.down: {
        _x = oPlayer.x;
        _y = oPlayer.y-95;
        _depth = _infront;
        break;
      }
    }
  }
  
  return {
    x: _x,
    y: _y,
    depth: _depth,
  };
}