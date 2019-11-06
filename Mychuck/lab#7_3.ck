Bowed bow => dac;

[60, 62, 64, 65, 67, 69, 71, 72, 71, 69, 67, 65, 64, 62, 60] @=> int scale[];

fun void playNotes(Bowed bow, int notes[]){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => bow.freq;
        1 => bow.noteOn;
        0.3::second => now;
        1 => bow.noteOff;
        0.1::second => now;
    }
}

fun void changePressure(Bowed bow, int notes[], float pressure){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => bow.freq;
        pressure => bow.bowPressure;
        1 => bow.noteOn;
        0.3::second => now;
        1 => bow.noteOff;
        0.1::second => now;
    }
}

fun void changePosition(Bowed bow, int notes[], float position){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => bow.freq;
        position => bow.bowPosition;
        1 => bow.noteOn;
        0.3::second => now;
        1 => bow.noteOff;
        0.1::second => now;
    }
}

fun void changeVibrato(Bowed bow, int notes[], float gain){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => bow.freq;
        gain => bow.vibratoGain;
        1 => bow.noteOn;
        0.3::second => now;
        1 => bow.noteOff;
        0.1::second => now;
    }
}

fun void changeVolume(Bowed bow, int notes[], float volume){
    for (0 => int i;i < notes.cap();i++)
    {
        Std.mtof(notes[i]) => bow.freq;
        volume => bow.volume;
        1 => bow.noteOn;
        0.3::second => now;
        1 => bow.noteOff;
        0.1::second => now;
    }
}

<<< "normal" >>>;
playNotes(bow, scale);
<<< "pressure" >>>;
changePressure(bow, scale, 1.0);
<<< "position" >>>;
changePosition(bow, scale, 1.0);
<<< "vibrato" >>>;
changeVibrato(bow, scale, 1.0);
<<< "volume" >>>;
changeVolume(bow, scale, 1.0);
