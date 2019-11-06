// 2014038013 백승민

Gain master[3];          
master[0] => dac.left;  
master[1] => dac;            
master[2] => dac.right;  

TriOsc tri_b => master[1];
SawOsc saw_t => master[1];
SqrOsc sqr => Pan2 sqrPan;
sqrPan.chan(0) => master[0];
sqrPan.chan(1) => master[2];
0.0 => float offGain;
offGain => tri_b.gain => saw_t.gain => sqr.gain;

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

[1,1,1,0, 0,1,0,0, 0,0,0,0, 1,1,1,0, 0,1,0,0, 0,1,1,1] @=> int cowHits[];

[42,-1,45,-1,50,-1,54,-1,50,-1,45,-1, 42,-1,45,-1,50,-1,54,-1,50,-1,45,-1] @=> int tri_bHits[];
[40,-1,45,-1,49,-1,52,-1,49,-1,45,-1, 40,-1,45,-1,49,-1,52,-1,49,-1,45,-1] @=> int tri_bHits2[];
[38,-1,42,-1,47,-1,50,-1,47,-1,42,-1, 38,-1,42,-1,47,-1,50,-1,47,-1,42,-1] @=> int tri_bHits3[];
[37,-1,42,-1,45,-1,49,-1,45,-1,42,-1, 37,-1,42,-1,45,-1,49,-1,45,-1,42,-1] @=> int tri_bHits4[];
[35,-1,38,-1,43,-1,47,-1,43,-1,38,-1, 50,-1,47,-1,43,-1,38,-1,43,-1,38,-1] @=> int tri_bHits5[];
[37,-1,40,-1,45,-1,49,-1,43,-1,40,-1, 52,-1,49,-1,45,-1,40,-1,45,-1,40,-1] @=> int tri_bHits6[];

[78,78,78,78,78,78,78,78,76,76,78,78, 81,81,81,81,81,81,78,78,78,78,78,78] @=> int saw_tHits[];
[76,76,76,76,76,76,76,76,73,73,74,74, 78,78,78,78,78,78,76,76,76,76,76,76] @=> int saw_tHits2[];
[74,74,74,74,74,74,74,74,74,74,76,76, 78,78,78,78,78,78,78,78,74,74,74,74] @=> int saw_tHits3[];
[73,73,73,73,73,73,73,73,73,73,73,73, 69,69,69,69,69,69,69,69,71,71,73,73] @=> int saw_tHits4[];
[74,74,74,74,74,74,74,74,74,74,74,74, 74,74,74,74,74,74,74,74,78,78,79,79] @=> int saw_tHits5[];
[81,81,81,81,81,81,81,81,81,81,81,81, 81,81,81,81,81,81,81,81,74,74,73,73] @=> int saw_tHits6[];
[74,74,74,74,74,74,74,74,74,74,74,74, 74,74,74,74,74,74,74,74,74,74,74,74] @=> int saw_tHits7[];

fun int[] makeSqrHits(int note)
{
    [note,-1,note,-1,note,-1,note,-1,note,-1,note,-1, note,-1,note,-1,note,-1,note,-1,note,-1,note, -1] @=> int sqrHits[];
    return sqrHits;
}

cowHits.cap() => int MAX_BEAT; 

4 => int MOD;  

0.15 :: second => dur tempo; 

0 => int beat;    
0 => int measure; 
0.7 => float trigain;
0.2 => float sawgain;
0.1 => float sqrgain;
Math.srandom(5);

fun void clef(Osc osc, int notes[], int beat, float gain)
{
    Std.mtof(notes[beat]) => osc.freq;
    gain => osc.gain;
}


//main
while (measure <= 16)
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
    
    if ((measure-1) % 8 == 0)
    {
        clef( tri_b,  tri_bHits, beat, trigain);
        clef(saw_t, saw_tHits, beat, sawgain);
    }
    
    if ((measure-1) % 8 == 1)
    {
        clef( tri_b,  tri_bHits2, beat, trigain);
        clef(saw_t, saw_tHits2, beat, sawgain);
    }
    
    if ((measure-1) % 8 == 2)
    {
        clef( tri_b,  tri_bHits3, beat, trigain);
        clef(saw_t, saw_tHits3, beat, sawgain);
    }
    
    if ((measure-1) % 8 == 3)
    {
        clef( tri_b,  tri_bHits4, beat, trigain);
        clef(saw_t, saw_tHits4, beat, sawgain);
    }

    if ((measure-1) % 8 == 4)
    {
        clef( tri_b,  tri_bHits5, beat, trigain);
        clef(saw_t, saw_tHits5, beat, sawgain);
    }
    
    if ((measure-1) % 8 == 5)
    {
        clef( tri_b,  tri_bHits6, beat, trigain);
        clef(saw_t, saw_tHits6, beat, sawgain);
    }
    
    if ((measure-1) % 8 == 6)
    {
        clef( tri_b,  tri_bHits, beat, trigain);
        clef(saw_t, saw_tHits7, beat, sawgain);
    }
    
    if ((measure-1) % 8 == 7)
    {
        clef( tri_b,  tri_bHits2, beat, trigain);
        offGain => saw_t.gain;
    }
    
    if (measure > 8)
    {
        if (measure % 8 == 3)
        {
            0.0 => sqrPan.pan;
            clef(sqr, makeSqrHits(83), beat, sqrgain);
        }
        else if (measure % 8 == 5)
        {
            0.0 => sqrPan.pan;
            clef(sqr, makeSqrHits(79), beat, sqrgain);
        }
        else if (measure % 2 == 1)
        {
            -1.0 => sqrPan.pan;
            clef(sqr, makeSqrHits(81), beat, sqrgain);
        }
        else
        {
            1.0 => sqrPan.pan;
            clef(sqr, makeSqrHits(81), beat, sqrgain);
        }            
    }
    
    tempo => now;      

    (beat + 1) % MAX_BEAT => beat; 
    if (beat==0)
    {            
        measure++;  
    }
}
