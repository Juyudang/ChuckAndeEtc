TriOsc t => dac;

0.1 :: second => dur en; // eighth (1/8)
0.25 :: second => dur qn; // quarter (1/4)
0.55 :: second => dur hn; // half (1/2)
0.05 :: second => dur rest;

0.5 => float onGain;
0.0 => float offGain;
// Harold Faltermeyer's Theme from the film Beverly Hills Cop (1984)
[65, -1, 68, -1, 65, 65, 70, 65, 63,
 65, -1, 72, -1, 65, 65, 73, 72, 68,
 65, 72, 77, 65, 63, 63, 60, 67, 65] @=> int bhcopNotes[];

[qn, qn, qn, en, qn, en, qn, qn, qn,
 qn, qn, qn, en, qn, en, qn, qn, qn,
 qn, qn, qn, en, qn, en, qn, qn, hn] @=> dur bhcopDurs[];

for(0 => int i;i < bhcopNotes.cap();i++)
{
    Std.mtof(bhcopNotes[i]) => t.freq;
    onGain => t.gain;
    bhcopDurs[i] => now;
    offGain => t.gain;
    rest => now;
}