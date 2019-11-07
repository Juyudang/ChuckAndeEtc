fun void playNote(StkInstrument stk,int note, dur duration) 
{
    if (note != -1) {
        Std.mtof(note) => stk.freq;
        0.33 => stk.noteOn;
    }
    duration => now;
    1.0 => stk.noteOff;
}

fun void play(StkInstrument stk, int notes[], dur durations[]){
    if(notes.cap() == durations.cap()){
        for (0 => int i;i < notes.cap();i++){
            playNote(stk, notes[i], durations[i]);
        }
    }
}

0.2::second => dur en; // eighth notes (1/8)
en * 2 => dur qn; // quarter notes (1/4)
qn * 2 => dur hn; // half notes (1/2)

[
65, 67, 69, 65,  65, 67, 69, 65,  69, 70, 72,  69, 70, 72,
72, 74, 72, 70, 69, 65, 72, 74, 72, 70, 69, 65, 65, 60, 65, 65, 60, 65
] @=> int melody[];

[
65, 67, 69, 65,  65, 67, 69, 65,  69, 70, 72,  69, 70, 72, 
72, 74, 72, 70, 69, 65, 72, 74, 72, 70, 69, 65, 69, 64, 69, 69, 64, 69
] @=> int high[];

[
qn, qn, qn, qn,  qn, qn, qn, qn, qn, qn, hn,  qn, qn, hn,
en, en, en, en, qn, qn, en, en, en, en, qn, qn, qn, qn, hn, qn, qn, hn
] @=> dur melodyDur[];

[
53, 60, 53,  53, 60, 53,  53, 60, 53,  53, 60, 53,
53, 60, 53,  53, 60, 53,  53, 60, 53,  53, 60, 53
] @=> int low[];

[
qn, qn, hn,  qn, qn, hn,  qn, qn, hn,  qn, qn, hn,
qn, qn, hn,  qn, qn, hn,  qn, qn, hn,  qn, qn, hn
] @=> dur lowDur[];

Clarinet cla_melo => dac;
Clarinet cla_high => dac;
Clarinet cla_low => dac;

spork ~ play(cla_melo, melody, melodyDur);
spork ~ play(cla_high, high, melodyDur);
spork ~ play(cla_low, low, lowDur);

while(true) 1::second => now;