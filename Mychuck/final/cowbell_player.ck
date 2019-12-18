// cowbell

SndBuf cowbell => dac;

me.dir() + "audio/cowbell_01.wav" => cowbell.read;

.3 => cowbell.gain;

while (true)
{
    0.3 => cowbell.rate;
    t.quarterNote => now;
    0 => cowbell.pos;
}