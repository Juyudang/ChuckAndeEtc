fun void playNote(StkInstrument stk,int note, dur duration) 
{
    if (note != -1) {
        Std.mtof(note) => stk.freq;
        1.0 => stk.noteOn;
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
    } else { <<< "different length!!" >>>; }
}

fun void playReverse(StkInstrument stk, int notes[], dur durations[]){
    if(notes.cap() == durations.cap()){
        for (notes.cap()-1 => int i;i >= 0;i--){
            playNote(stk, notes[i], durations[i]);
        }
    } else { <<< "different length!!!" >>>; }
}

0.2::second => dur en; // eighth note (1/8)
en * 2 => dur qn; // quarter note (1/4)
en * 4 => dur hn; // half note (1/2)

// Bach Canon Score
[
60, 63, 67, 68, 59, -1, 
67, 66, 65, 64, 63, 62, 61, 60,
59, 55, 62, 65, 63, 62, 60, 63,
67, 65, 67, 72, 67, 63, 62, 63, 65, 67, 69, 71, 
72, 63, 65, 67, 68, 62, 63, 65, 67, 65, 63, 62,
63, 65, 67, 68, 70, 68, 67, 65, 67, 68, 70, 72,
73, 70, 68, 67, 69, 71, 72, 74, 75, 72, 71, 69, 
71, 72, 74, 75, 77, 74, 67, 74, 72, 74, 75, 77,
75, 74, 72, 71, 72, 67, 63, 60
] @=> int notes[];

[
hn, hn, hn, hn, hn, qn, 
hn, hn, hn, hn, hn, qn, qn, qn,
qn, qn, qn, qn, hn, hn, hn, hn,
en, en, en, en, en, en, en, en, en, en, en, en,
en, en, en, en, en, en, en, en, en, en, en, en,
en, en, en, en, en, en, en, en, en, en, en, en,
en, en, en, en, en, en, en, en, en, en, en, en,
en, en, en, en, en, en, en, en, en, en, en, en, 
en, en, en, en, qn, qn, qn, qn
] @=> dur durs[];

Rhodey rho1 => Gain instrument => dac;
Rhodey rho2 => instrument => dac;
0.5 => instrument.gain;
spork ~ play(rho1, notes, durs);
spork ~ playReverse(rho2, notes, durs);

while (true) { 1::second => now; }