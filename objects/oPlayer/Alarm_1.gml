/// @description Insert description here
// You can write your code in this editor

if (hasItem && instance_exists(hasItem)) {
  with (hasItem) {
    instance_destroy();
  }
  
  hasItem = noone;
  carryLimit = 0;
}

if (nearbyNPC && instance_exists(nearbyNPC)) {
  with (nearbyNPC) {
    state = NPCState.done;
  }
}