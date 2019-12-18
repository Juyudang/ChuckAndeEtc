// snare

SndBuf snare => dac;

me.dir() + "audio/snare_01.wav" => snare.read;

.3 => snare.gain;

while (true)
{
    0.3 => snare.rate;
    1.0 :: second => now;
    0 => snare.pos;
}