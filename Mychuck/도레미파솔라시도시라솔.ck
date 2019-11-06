SinOsc s => dac;

[60, 62, 64, 65, 67, 69, 71, 72, 71, 69, 67, 65, 64, 62, 60] @=> int notes[];

0.5 =>  float onGain;
0.0 => float offGain; 

for (0 => int i;i < notes.size();i++) {
    Std.mtof(notes[i]) => s.freq;
    onGain => s.gain;
    0.3::second => now;
    offGain => s.gain;
    0.2::second => now;
}