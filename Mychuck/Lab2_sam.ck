SqrOsc scale => dac;

// note length
//0.3::second => dur qn; // quarter note (1/4)
//0.6::second => dur hn; // half note (1/2)

// note length
0.25::second => dur qn; // quarter (1/4 ??)
0.55::second => dur hn; // half note (1/2 ?)
0.05::second => dur rest; // ?? : qn? 1/6

// volume
1.0 => float onGain;
0.0 => float offGain;

1.0 => scale.gain;

for (48 => int i; i <= 60; i++) {
    onGain => scale.gain;
    Std.mtof(i) => scale.freq;
    if (i == 60)
        {
        hn => now;
        offGain => scale.gain;
        rest => now;
        }
        else 
            {
        qn => now;
        offGain => scale.gain;
        rest => now;
    }
}

for (60 => int i; i >= 48; i--) {
    onGain => scale.gain;
    Std.mtof(i) => scale.freq;
    if (i == 48)
        {
        hn => now;
        offGain => scale.gain;
        rest => now;
    }
    else
        {
        qn => now;
        offGain => scale.gain;
        rest => now;
    }
}