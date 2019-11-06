// Listing 4.9 Improving the while loop of your drum machine

// Drum Machine, version 2.0
// by block-rockin programmer, Dec 32, 1999

// SndBufs for kick (bass) and snare drums
SndBuf kick => dac.left; // (1) Kick to master mixer Gain to dac.
SndBuf snare => dac;            // (2) Snare also to master mixer.
SndBuf hihat => dac.right;
// load up some samples of those   // (3) Loads your kick and snare drum sound files.
"/Library/ChucK/examples/book/digital-artists" => string path;
path+"/audio/kick_01.wav" => kick.read;
path+"/audio/snare_01.wav" => snare.read;
path+"/audio/hihat_01.wav" => hihat.read;

// declare a new tempo variable
0.15 :: second => dur tempo;       // (4) Tempo duration is time between beats.

while (true)
{
    for (0 => int beat; beat < 16; beat++)  // (5) Loops over a "measure" of 16 beats.
    {
        // play kick drum on beat 0, 4, 8, and 12
        if (beat==0 || beat==4 || beat==8 || beat==12)  // (6) Plays kick only on specific beats.
        {
            0 => kick.pos;
        }
        
        // play snare drum on beat 4, 10, 13, and 14
        if (beat==4 || beat==10 || beat==13 || beat==14) // (7) Plays snare only on other specific beats.
        {
            0 => snare.pos;
        }
        if (beat==2 || beat==5 || beat== 6)
        {
            0 => hihat.pos;
        }
        tempo => now;
    }
}
