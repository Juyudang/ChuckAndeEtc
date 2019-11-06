//악기 생성 (만일 동시에 소리를 내야한다면, 동시 낼 수 있는 악기 만큼 생성해야함)
SinOsc sin => dac;
SinOsc sin_2 => dac; 
//안쓰는 값은 쓰일때까지 Default값이 들어간다. 윈도우였으면 지금 지지직 거렸을 것;;
// 게인값 0 을 넣어놓자(중요)
SinOsc sin2 => Pan2 mpan => dac;
// pan은 파노라마기능으로, -1 ~ 1(전방 좌 ~ 우) 사이의 위치에 소리를 할당. 이어폰 꽂으면 좌우 다르게
// 들리는거 생각하면 편함

0.2::second => dur s; // fourth (1/16)
0.4::second => dur e; // Half (1/8)
0.8::second => dur t; // Half (1/8)


0.7 => float onGain;
0.0 => float offGain;

// For Elise by Beethoven
[65, 67, 69, 65, 65, 67, 69, 65] @=> int newNotes1[];
[ e,  e,  e,  e,  e,  e,  e,  e] @=> dur newDurs1[];
[69, 70, 72, 69, 70, 72] @=> int newNotes2[];
[e,  e,  t,  e,  e,  t] @=> dur newDurs2[];
[72, 74, 72, 70, 69, 65, 72, 74, 72, 70, 69, 65] @=> int newNotes3[];
[ s,  s,  s,  s,  e,  e,  s,  s,  s,  s,  e,  e] @=> dur newDurs3[];
// 마지막 두마디
[65, 60, 65, 65, 60, 65] @=> int newNotes4[];
[69, 64, 69, 69, 64, 69] @=> int newNotes4_2[];
[ e,  e,  t,  e,  e,  t] @=> dur newDurs4[];

//화음 : 라도라~라도라~
[53, 60, 53, -1, 53, 60, 53, -1] @=> int lowNote1[];
[ e,  e,  e,  e,  e,  e,  e,  e] @=> dur lowDurs1[];
[53, 60, 53, 53, 60, 53] @=> int lowNote2[];
[ e,  e,  t,  e,  e,  t] @=> dur lowDurs2[];
[53, -1, 60, -1, 53, -1, 53, -1, 60, -1, 53, -1] @=> int lowNote3[];
//화음은 배열을 같이 읽기에 배열길이를 같게 할 수밖에 없음

offGain => sin_2.gain;

for (0 => int i;i< newNotes1.cap();i++)
{
    Std.mtof(newNotes1[i]) => sin.freq;    
    Std.mtof(lowNote1[i]) => sin2.freq;
    Math.random2f(-1.0, 1.0) => mpan.pan;
    onGain => sin.gain => sin2.gain;
    newDurs1[i] => now;
    offGain => sin.gain => sin2.gain;
    0.01::second => now;
}

for (0 => int i;i< newNotes2.cap();i++)
{
    Std.mtof(newNotes2[i]) => sin.freq;
    Std.mtof(lowNote2[i]) => sin2.freq;
    Math.random2f(-1.0, 1.0) => mpan.pan; //파노라마 : 노래에 공간을 입힘
    onGain => sin.gain => sin2.gain;
    newDurs2[i] => now;
    offGain => sin.gain => sin2.gain;
    0.01::second => now;  
}

//둘째 줄

for (0 => int i;i< newNotes3.cap();i++)
{
    Std.mtof(newNotes3[i]) => sin.freq;
    Std.mtof(lowNote3[i]) => sin2.freq;
    Math.random2f(-1.0, 1.0) => mpan.pan;
    onGain => sin.gain => sin2.gain;
    newDurs3[i] => now;
    offGain => sin.gain => sin2.gain;
    0.01::second => now;  
}

for (0 => int i;i< newNotes4.cap();i++)
{
    Std.mtof(newNotes4_2[i]) => sin_2.freq;    
    Std.mtof(newNotes4[i]) => sin.freq;
    Std.mtof(lowNote2[i]) => sin2.freq;
    Math.random2f(-1.0, 1.0) => mpan.pan;
    onGain => sin.gain => sin2.gain => sin_2.gain;
    newDurs4[i] => now; 
    offGain => sin.gain => sin2.gain => sin_2.gain;
    0.01::second => now;  
}
