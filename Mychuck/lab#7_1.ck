BlowHole hole => dac;
BlowBotl botl => dac;
Saxofony sax => dac;

[60, 62, 64, 65, 67, 69, 71, 72, 71, 69, 67, 65, 64, 62, 60] @=> int scale[];
 
 fun void playNotes(StkInstrument stk, int notes[]){
     for (0 => int i;i < notes.cap();i++)
     {
         Std.mtof(notes[i]) => stk.freq;
         1 => stk.noteOn;
         0.3::second => now;
         1 => stk.noteOff;
         0.1::second => now;
     }
}

playNotes(hole, scale);
playNotes(botl, scale);
playNotes(sax, scale);