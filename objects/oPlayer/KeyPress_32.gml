/// @description Insert description here
// You can write your code in this editor

function getNPCResponse() {
  if (nearbyNPC.state == NPCState.done) {
    return {
      text: nearbyNPC.itemTextDone,
      seq: noone,
    };
  }
  if (hasItem && instance_exists(hasItem)) {
      if (hasItem.object_index == nearbyNPC.myItem) {
        alarm[1] = 10;
        return {
        text: nearbyNPC.itemTextHappy,
        seq: nearbyNPC.sequenceHappy,
        }
      }  
      return {
        text: nearbyNPC.itemTextSad,
        seq: nearbyNPC.sequenceSad,
      }
    }
    return {
      text: nearbyNPC.myText,
      seq: noone,
    }
}

function handleNPCInteraction() {
  if (nearbyNPC && global.playerControl) {
    global.playerControl = false;
    var _response;
    
    _response = getNPCResponse();
    
    if (!instance_exists(oTextbox)) {
      var _textBox = instance_create_depth(nearbyNPC.x - 300, nearbyNPC.y - 400, -10000, oTextbox);
    
      _textBox.textToShow = _response.text;
      _textBox.sequenceToShow = _response.seq;
    }
  }
}

function handleItemInteraction() {
  if (nearbyItem && global.playerControl) {
    if (!hasItem) {
      global.playerControl = false;
      state = PlayerState.pickingUp;
      image_index = 0;
      hasItem = nearbyItem;
      carryLimit = hasItem.weight * 0.1;
      with (hasItem) {
        state = ItemState.taken;
      }
      if (itemPrompt) {
        scrDismissPrompt(itemPrompt, 1);
      }
      
      audio_play_sound(snd_itemPickup, 1,0);
    }
    return;
  }
  
  if(hasItem && global.playerControl) {
    state = PlayerState.puttingDown;
    carryLimit = 0;
    image_index = 0;
    global.playerControl = false;
    with (hasItem) {
      putDownY = oPlayer.y+5;
      state = ItemState.puttingBack;
    }
    
    audio_play_sound(snd_itemPutDown,1,0);
    hasItem = noone;
  }
}

handleNPCInteraction();
handleItemInteraction();
