SinOsc sin => dac;

0.3::second => dur s; // sixteenth (1/16)
0.6::second => dur e; // eighth (1/8)

0.7 => float onGain;
0.0 => float offGain;

// For Elise by Beethoven
[76, 75, 76, 75, 76, 71, 74, 72, 69, -1] @=> int forEliseNotes1[];
[ s,  s,  s,  s,  s,  s,  s,  s,  e, s] @=> dur forEliseDurs1[];
[60, 64, 69, 71, -1] @=> int forEliseNotes2[];
[ s,  s,  s,  e, s] @=> dur forEliseDurs2[];
[64, 68, 71, 72, -1] @=> int forEliseNotes3[];
[ s,  s,  s,  e, s] @=> dur forEliseDurs3[];
[64, 72, 71, 69] @=> int forEliseNotes4[];
[ s,  s,  s,  e] @=> dur forEliseDurs4[];

for (0 => int j;j < 2;j++) {
    
    for (0 => int i;i< forEliseNotes1.cap();i++)
    {
        Std.mtof(forEliseNotes1[i]) => sin.freq;
        onGain => sin.gain;
        forEliseDurs1[i] => now;
    }
   
    for (0 => int i;i< forEliseNotes2.cap();i++)
    {
        Std.mtof(forEliseNotes2[i]) => sin.freq;
        onGain => sin.gain;
        forEliseDurs2[i] => now;
    }
    
    for (0 => int i;i< forEliseNotes3.cap();i++)
    {
        Std.mtof(forEliseNotes3[i]) => sin.freq;
        onGain => sin.gain;
        forEliseDurs3[i] => now;
    }
    ////////////////////////////////
    Std.mtof(64) => sin.freq;
    onGain => sin.gain;
    s => now;
    
    for (0 => int i;i< forEliseNotes1.cap();i++)
    {
        Std.mtof(forEliseNotes1[i]) => sin.freq;
        onGain => sin.gain;
        forEliseDurs1[i] => now;
    }
    
    for (0 => int i;i< forEliseNotes2.cap();i++)
    {
        Std.mtof(forEliseNotes2[i]) => sin.freq;
        onGain => sin.gain;
        forEliseDurs2[i] => now;
    }
    
    for (0 => int i;i< forEliseNotes4.cap();i++)
    {
        Std.mtof(forEliseNotes4[i]) => sin.freq;
        onGain => sin.gain;
        forEliseDurs4[i] => now;
    }
    
    offGain => sin.gain;
    e => now;
}
