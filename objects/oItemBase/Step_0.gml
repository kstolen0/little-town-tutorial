/// @description Insert description here
// You can write your code in this editor

switch state {
  case ItemState.idle: {
    depth = -y;
    break;
  }
  case ItemState.taken: {
    var _result = scrItemPosition();
    x = _result.x;
    y = _result.y;
    depth = _result.depth;
    break;
  }
  case ItemState.puttingBack: {
    if (y != putDownY) {
      y = lerp(y, putDownY, 0.3);
      break;
    }
    state = ItemState.idle;
    break;
  }
}
