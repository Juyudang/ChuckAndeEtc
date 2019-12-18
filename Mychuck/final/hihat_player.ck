// hihat

SndBuf hihat => dac;

me.dir() + "audio/hihat_01.wav" => hihat.read;

.3 => hihat.gain;

while (true)
{
    0.3 => hihat.rate;
    1.0 :: second => now;
    0 => hihat.pos;
}