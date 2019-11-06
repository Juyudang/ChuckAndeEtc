fun void playNotes(Osc osc, int notes[], dur durs[], float gain, dur tail) {
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => osc.freq;
        gain => osc.gain;
        durs[i] => now;
        0.0 => osc.gain;
        tail => now;
    }
}

SqrOsc sqr => dac;
[60, 62, 64, 65, 67, 69, 71] @=> int mma[];

0.3::second => dur s;
[ s,  s,  s,  s,  s,  s,  s] @=> dur nnb[];

playNotes(sqr, mma, nnb, 0.3, 0.1::second);