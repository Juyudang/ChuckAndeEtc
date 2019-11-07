fun void playNote(StkInstrument stk,int note, dur duration) 
{
    if (note != -1) {
        Std.mtof(note) => stk.freq;
        0.20 => stk.noteOn;
    }
    duration => now;
    1.0 => stk.noteOff;
    0.05::second => now;
}

fun void play(StkInstrument stk, int notes[], dur durations[]){
    if(notes.cap() == durations.cap()){
        for (0 => int i;i < notes.cap();i++){
            playNote(stk, notes[i], durations[i]);
        }
    }
}

// 6/8 ??
0.2::second => dur sn; // sixth note (1/6)
sn * 2 => dur tn; // third note (1/3)
sn * 3 => dur hn; // half note (1/2)
sn * 6 => dur wn; // whole note (1)

[
60, 60, 60, 62, 64,
64, 62, 64, 65, 67,
72, 72, 72, 67, 67, 67, 64, 64, 64, 60, 60, 60,
67, 65, 64, 62, 60
] @=> int melody[];

[
hn, hn, tn, sn, hn, 
tn, sn, tn, sn, wn,
sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn,
tn, sn, tn, sn, wn
] @=> dur melodyDur[];

Clarinet cla_1 => dac;
Clarinet cla_2 => dac;
Clarinet cla_3 => dac;
Clarinet cla_4 => dac;

spork ~ play(cla_1, melody, melodyDur);

spork ~ play(cla_2, melody, melodyDur);
wn => now;

spork ~ play(cla_3, melody, melodyDur);
2*hn => now;

spork ~ play(cla_4, melody, melodyDur);
3*wn => now;

while(true) 1::second => now;