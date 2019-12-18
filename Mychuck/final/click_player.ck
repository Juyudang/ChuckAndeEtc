// click

SndBuf click => dac;

me.dir() + "audio/click_01.wav" => click.read;

.3 => click.gain;

while (true)
{
    0.3 => click.rate;
    1.0 :: second => now;
    0 => click.pos;
}

