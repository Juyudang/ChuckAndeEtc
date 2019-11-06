// Listing 4.10 Using arrays to further improve your drum machine

// Drum Machine, version 3.0
// by block-rockin programmer, Dec 31, 1999

// SndBufs for kick (bass) and snare drums
SndBuf kick => Gain master => dac;   // (1) kick, snare, and hihat 
SndBuf snare => master;              // SndBufs into mixer to dac
SndBuf hihat => master;
SawOsc saw => master;

"/Library/ChucK/examples/book/digital-artists" => string path;
// load up some samples of those 
path+"/audio/kick_01.wav" => kick.read;
path+"/audio/snare_01.wav" => snare.read;
path+"/audio/hihat_01.wav" => hihat.read;

0.5 => saw.gain;
0.3 => hihat.gain;
0.15 :: second => dur tempo;

// scores (arrays) to tell drums when to play
[1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0] @=> int kickHits[];  // (1) Arrays to control when kick 
[0,0,1,0,0,0,1,0,0,0,0,0,1,1,1,1] @=> int snareHits[]; //     and snare play

while (true)
{
    0 => int beat;
    while (beat < kickHits.cap())
    {
        // play kick drum on based on array value
        if (kickHits[beat])  // Checks array at location
        {                    // beat to see if you should
            0 => kick.pos;   // play the kick drum now.
        }
        
        if (snareHits[beat]) // Checks array at location
        {                    // beat to see if you should
            0 => snare.pos;  // play the snare drum now.
        }
        
        if (Math.random2(0,2)==0)
            {
                Std.mtof(Math.random2(60,72)) => saw.freq;
                
            }
        
        // always play hihat
        1 => hihat.pos;      // Play hihat on every beat for now.
        tempo => now;        // Advance time; lets sound synthesize.
        beat++;              // Increments to next beat, and goes back 
    }                        // and does the inner while loop again.
}
