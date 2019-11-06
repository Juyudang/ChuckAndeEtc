Mandolin mandolin => dac;

[60, 62, 64, 65, 67, 69, 71, 72, 71, 69, 67, 65, 64, 62, 60] @=> int scale[];

fun void playNotes(Mandolin mandolin, int notes[]){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => mandolin.freq;
        1 => mandolin.noteOn;
        0.3::second => now;
        1 => mandolin.noteOff;
        0.1::second => now;
    }
}

fun void changeBody(Mandolin mandolin, int notes[], float percentage){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => mandolin.freq;
        percentage => mandolin.bodySize;
        1 => mandolin.noteOn;
        0.3::second => now;
        1 => mandolin.noteOff;
        0.1::second => now;
    }
}

fun void changePluck(Mandolin mandolin, int notes[], float position){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => mandolin.freq;
        position => mandolin.pluckPos;
        1 => mandolin.noteOn;
        0.3::second => now;
        1 => mandolin.noteOff;
        0.1::second => now;
    }
}

fun void changeDamping(Mandolin mandolin, int notes[], float damping){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => mandolin.freq;
        damping => mandolin.stringDamping;
        1 => mandolin.noteOn;
        0.3::second => now;
        1 => mandolin.noteOff;
        0.1::second => now;
    }
}

fun void changeDetune(Mandolin mandolin, int notes[], float detuning){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => mandolin.freq;
        detuning => mandolin.stringDetune;
        1 => mandolin.noteOn;
        0.3::second => now;
        1 => mandolin.noteOff;
        0.1::second => now;
    }
}

playNotes(mandolin, scale);
changeBody(mandolin, scale, 0.2);
changePluck(mandolin, scale, 0.2);
changeDamping(mandolin, scale, 0.2);
changeDetune(mandolin, scale, 0.2);