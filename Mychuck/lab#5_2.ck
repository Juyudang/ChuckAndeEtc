fun void playNote(Osc osc, int note, dur duration, float gain, dur tail) {
    Std.mtof(note) => osc.freq;
    gain => osc.gain;
    duration => now;
    tail => now;
}

SinOsc sin => dac;
playNote(sin, 62, second, 0.7, 0.1::second);
playNote(sin, 65, second, 0.7, 0.1::second);
playNote(sin, 68, second, 0.7, 0.1::second);