// 2014038013 백승민

Gain master[3];          
master[0] => dac.left;  
master[1] => dac;            
master[2] => dac.right;  

TriOsc tri => dac;

SndBuf kick => master[0];

SndBuf snare2 => master[1];  
SndBuf snare => master[1];

SndBuf hihat => master[2];
SndBuf snare3 => master[2];

SndBuf claps => Pan2 claPan; 
claPan.chan(0) => master[0]; 
claPan.chan(1) => master[2]; 

me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;
me.dir()+"/audio/snare_02.wav" => snare2.read;
me.dir()+"/audio/snare_03.wav" => snare3.read;
me.dir()+"/audio/hihat_01.wav" => hihat.read;
me.dir()+"/audio/clap_01.wav" => claps.read;

0.7 => float onGain;
0.0 => float offGain;

[1,1,1,0, 0,1,0,0, 0,0,0,0, 1,1,1,0, 0,1,0,0, 0,1,1,1] @=> int cowHits[];

[42,-1,45,-1,50,-1,54,-1,50,-1,45,-1, 42,-1,45,-1,50,-1,54,-1,50,-1,45,-1] @=> int triHits[];
[40,-1,45,-1,49,-1,52,-1,49,-1,45,-1, 40,-1,45,-1,49,-1,52,-1,49,-1,45,-1] @=> int triHits2[];
[38,-1,42,-1,47,-1,50,-1,47,-1,42,-1, 38,-1,42,-1,47,-1,50,-1,47,-1,42,-1] @=> int triHits3[];
[37,-1,42,-1,45,-1,49,-1,45,-1,42,-1, 37,-1,42,-1,45,-1,49,-1,45,-1,42,-1] @=> int triHits4[];
[35,-1,38,-1,43,-1,47,-1,43,-1,38,-1, 50,-1,47,-1,43,-1,38,-1,43,-1,38,-1] @=> int triHits5[];
[37,-1,40,-1,45,-1,49,-1,43,-1,40,-1, 52,-1,49,-1,45,-1,40,-1,45,-1,40,-1] @=> int triHits6[];


cowHits.cap() => int MAX_BEAT; 

4 => int MOD;  

0.15 :: second => dur tempo; 

0 => int beat;    
0 => int measure; 

Math.srandom(5);

while (true)
{
    if (beat % 12 == 6)    
    {                      
        0 => snare2.pos;
    }

    if (beat % 12 == 0 || beat % 12 == 8 || beat % 12 == 10)    
    {                      
        0 => kick.pos;
    }
    
    if (beat % 21 == 8 || beat % 24 == 10 || beat % 24 == 12)    
    {                      
        0 => snare3.pos;
    }
    
    if (measure >= 0) 
    {    
        if (cowHits[beat])
        {
            0 => snare.pos;
        }
    }
    
    if (beat >= Math.random2(12, 18) && measure >= 1)
    {
        Math.random2f(-1.0, 1.0) => claPan.pan;
        0 => claps.pos;
    }
    
    if (measure == 0)
    {
        Std.mtof(triHits[beat]) => tri.freq;
        onGain => tri.gain;
    }
    
    if (measure == 1)
    {
        Std.mtof(triHits2[beat]) => tri.freq;
        onGain => tri.gain;
    }
    
    if (measure == 2)
    {
        Std.mtof(triHits3[beat]) => tri.freq;
        onGain => tri.gain;
    }
    
    if (measure == 3)
    {
        Std.mtof(triHits4[beat]) => tri.freq;
        onGain => tri.gain;
    }

    if (measure == 4)
    {
        Std.mtof(triHits5[beat]) => tri.freq;
        onGain => tri.gain;
    }
    
    if (measure == 5)
    {
        Std.mtof(triHits6[beat]) => tri.freq;
        onGain => tri.gain;
    }
    
    if (measure == 6)
    {
        Std.mtof(triHits[beat]) => tri.freq;
        onGain => tri.gain;
    }
    
    if (measure == 7)
    {
        Std.mtof(triHits2[beat]) => tri.freq;
        onGain => tri.gain;
    }
    tempo => now;      

    (beat + 1) % MAX_BEAT => beat; 
    if (beat==0)
    {            
        measure++;  
    }
}
