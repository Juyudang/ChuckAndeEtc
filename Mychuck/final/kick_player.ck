// kick

SndBuf kick => dac;

me.dir() + "audio/kick_01.wav" => kick.read;

0.3 => kick.gain;

while (true)
{
    0.3 => kick.rate;
    1.0 :: second => now;
    0 => kick.pos;
}

