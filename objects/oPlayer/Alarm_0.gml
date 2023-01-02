/// @description Insert description here
// You can write your code in this editor

var _dustX, _dustY;
_dustX = oPlayer.x-(vx*4);
_dustY = irandom_range(oPlayer.y-10, oPlayer.y+10);
if (running) {
  if (vx != 0 || vy != 0) {
    instance_create_depth(_dustX, _dustY, depth+2, oDust);
  }
  
  alarm[0] = 4 + (1+carryLimit);
}