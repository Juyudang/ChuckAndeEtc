SinOsc sin => dac;

0.8::second => dur s; // fourth (1/16)
1.6::second => dur e; // Half (1/8)

0.7 => float onGain;
0.0 => float offGain;

// For Elise by Beethoven
[67, 67, 69, 69, 67, 67, 64] @=> int schoolNotes1[];
[ s,  s,  s,  s,  s,  s,  e] @=> dur schoolDurs1[];
[67, 67, 64, 64, 62, -1] @=> int schoolNotes2[];
[ s,  s,  s,  s, e*1.5, s] @=> dur schoolDurs2[];
[67, 64, 62, 64, 60, -1] @=> int schoolNotes3[];
[ s,  s,  s,  s, e*1.5, s] @=> dur schoolDurs3[];

for (0 => int i;i< schoolNotes1.cap();i++)
{
    Std.mtof(schoolNotes1[i]) => sin.freq;
    onGain => sin.gain;
    schoolDurs1[i] => now;
    offGain => sin.gain;
    0.1::second => now;
}

for (0 => int i;i< schoolNotes2.cap();i++)
{
    Std.mtof(schoolNotes2[i]) => sin.freq;
    onGain => sin.gain;
    schoolDurs2[i] => now;
    offGain => sin.gain;
    0.1::second => now;
}
////////////////////////////////

for (0 => int i;i< schoolNotes1.cap();i++)
{
    Std.mtof(schoolNotes1[i]) => sin.freq;
    onGain => sin.gain;
    schoolDurs1[i] => now;
    offGain => sin.gain;
    0.1::second => now;
}

for (0 => int i;i< schoolNotes3.cap();i++)
{
    Std.mtof(schoolNotes3[i]) => sin.freq;
    onGain => sin.gain;
    schoolDurs3[i] => now;
    offGain => sin.gain;
    0.1::second => now;    
}
    