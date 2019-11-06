SinOsc s => Pan2 mpan => dac;
TriOsc t => dac;

0.5 => t.gain;
0.5 => float onGain;
0.0 => float offGain;

72 => int melodyNote;

Math.srandom(1000); // 랜덤 값을 지정해줌 다시 실행해도 랜덤이 ㅈ ㅓ장되어 같은 결과가 나옴

while (true)
{
    Math.random2(-3, 3) +=> melodyNote;
    
    if (melodyNote < 60)
    {
        60 => melodyNote;
    }
    if (melodyNote > 84)
    {
        84 => melodyNote;
    }
    Std.mtof(melodyNote) => s.freq;
    
    Math.random2f(-1.0, 1.0) => mpan.pan;
    
    if (Math.random2(1,6) ==1)
    {
        Std.mtof(melodyNote-12) => t.freq;
    }
    
    Math.random2(1,3)*0.2 => float myDur;
    
    onGain => s.gain;
    (myDur*0.8)::second => now;
    
    offGain => s.gain;
    (myDur*0.2)::second => now;
}