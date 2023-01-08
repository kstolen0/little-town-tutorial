/// @description Insert description here
// You can write your code in this editor

if (room == rmMainTitle) {
  if (!global.gameStart) {
    audio_stop_all();
    global.gameStart = true;
    room_goto(rmGameMain);
  }
}
