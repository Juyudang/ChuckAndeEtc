//2014038013 백승민
SinOsc sin => Pan2 span => dac;
TriOsc tri => Pan2 tpan => dac;

0.15::second => dur t;
0.3::second => dur s;

0.7 => float onGain;
0.0 => float offGain;

[ s,  s,  s,  s,  s,  s,  s,  s,  s,  s,  s,  s] @=> dur Durs1[];
[75, 80, 75, 80, 74, 80, 74, 80, 73, 80, 73, 80] @=> int sinNotes1[];
[43, 51, 43, 51, 43, 50, 43, 50, 43, 49, 43, 49] @=> int triNotes1[];

[ s,  s,  s,  t,  t] @=> dur Durs2[];
[72, 80, 72, 73, 74] @=> int sinNotes2[];
[43, 48, 43, 44, 43] @=> int triNotes2[];

[ s, s, s, s] @=> dur Durs3[];
[83, 82, 80, -1] @=> int sinNotes3[];
[42, 40, 39, 25] @=> int triNotes3[];

Math.srandom(5);

while (true)
{  
//1
for (0 => int i;i< Durs1.cap();i++)
{
    Math.random2f(-1.0, 0.0) => span.pan;
    Math.random2f(0.0, 1.0) => tpan.pan;
    Std.mtof(sinNotes1[i]) => sin.freq;
    Std.mtof(triNotes1[i]) =>tri.freq;
    onGain => sin.gain => tri.gain;
    Durs1[i] => now;
    offGain => sin.gain;
    0.01::second => now;  
}

0.0 => span.pan;
0.0 => tpan.pan;
for (0 => int i;i< Durs2.cap();i++)
{
    Std.mtof(sinNotes2[i]) => sin.freq;
    Std.mtof(triNotes2[i]) =>tri.freq;
    onGain => sin.gain => tri.gain;
    Durs2[i] => now;
    offGain => sin.gain => tri.gain;
    0.01::second => now;  
}

//2
for (0 => int i;i< Durs1.cap();i++)
{
    Math.random2f(0.0, 1.0) => span.pan;
    Math.random2f(-1.0, 0.0) => tpan.pan;
    Std.mtof(sinNotes1[i]) => sin.freq;
    Std.mtof(triNotes1[i]) =>tri.freq;
    onGain => sin.gain => tri.gain;
    Durs1[i] => now;
    offGain => sin.gain => tri.gain;
    0.01::second => now;  
}

0.0 => span.pan;
0.0 => tpan.pan;
for (0 => int i;i< Durs3.cap();i++)
{
    Std.mtof(sinNotes3[i]) => sin.freq;
    Std.mtof(triNotes3[i]) =>tri.freq;
    onGain => sin.gain => tri.gain;
    Durs3[i] => now;
    offGain => sin.gain => tri.gain;
    0.01::second => now;  
}
}