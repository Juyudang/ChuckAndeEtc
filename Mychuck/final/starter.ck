Hid hi;                  // (1) Makes a new Hid object...
HidMsg msg;              // (2) ...and Hid message holder.
0 => int device;         // (3) Keyboard device number.
if( !hi.openKeyboard( device ) ) me.exit();  // (4) Opens it, exits if failed.

while( true )
{
    hi => now;                    // (7) Waits for keyboard event.
    while( hi.recv( msg ) )       // (8) loops over all messages (keys pressed).
    {
        if( msg.isButtonDown() )
        {                         // (9) If keyDown, set frequency from keycode...
            if (msg.ascii == 67) {
                me.dir() + "click_player.ck" => string scorePath;
                Machine.add(scorePath);
            }
            if (msg.ascii == 75) {
                me.dir() + "kick_player.ck" => string scorePath;
                Machine.add(scorePath);
            }
            if (msg.ascii == 83) {
                me.dir() + "snare_player.ck" => string scorePath;
                Machine.add(scorePath);
            }
            if (msg.ascii == 66) {
                me.dir() + "cowbell_player.ck" => string scorePath;
                Machine.add(scorePath);
            }
            if (msg.ascii == 72) {
                me.dir() + "hihat_player.ck" => string scorePath;
                Machine.add(scorePath);
            }
            
        }
        else // button up, noteOff
        {
            // deactivate the note
            //0 => .freq;   // (11) End the note on keyUp.
        }
    }
}
