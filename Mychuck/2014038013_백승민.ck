0.8::second => dur quarter;

quarter => now;

SinOsc s => dac;

<<< "First" >>>;
220 => s.freq;
1.0 => s.gain;
quarter*3/4 => now;

240 => s.freq;
1.0 => s.gain;
quarter/4 => now;

270 => s.freq;
1.0 => s.gain;
quarter*3/4 => now;

220 => s.freq;
1.0 => s.gain;
quarter/4 => now;

270 => s.freq;
1.0 => s.gain;
quarter/2 => now;

220 => s.freq;
1.0 => s.gain;
quarter/2 => now;

270 => s.freq;
1.0 => s.gain;
quarter => now;

<<< "Second" >>>;

240 => s.freq;
1.0 => s.gain;
quarter*3/4 => now;

270 => s.freq;
1.0 => s.gain;
quarter/4 => now;

290 => s.freq;
1.0 => s.gain;
quarter/4 => now;

290 => s.freq;
1.0 => s.gain;
quarter/4 => now;

270 => s.freq;
1.0 => s.gain;
quarter/4 => now;

240 => s.freq;
1.0 => s.gain;
quarter/4 => now;

290 => s.freq;
1.0 => s.gain;
quarter*1.5 => now;

0 => s.gain;
quarter/2 => now;
//--------------------------------------------
<<< "Third" >>>;

270 => s.freq;
1.0 => s.gain;
quarter*3/4 => now;

290 => s.freq;
1.0 => s.gain;
quarter/4 => now;

320 => s.freq;
1.0 => s.gain;
quarter*3/4 => now;

270 => s.freq;
1.0 => s.gain;
quarter/4 => now;

320 => s.freq;
1.0 => s.gain;
quarter/2 => now;

270 => s.freq;
1.0 => s.gain;
quarter/2 => now;

320 => s.freq;
1.0 => s.gain;
quarter => now;

<<< "Fourth" >>>;

290 => s.freq;
1.0 => s.gain;
quarter*3/4 => now;

320 => s.freq;
1.0 => s.gain;
quarter/4 => now;

360 => s.freq;
1.0 => s.gain;
quarter/4 => now;

360 => s.freq;
1.0 => s.gain;
quarter/4 => now;

320 => s.freq;
1.0 => s.gain;
quarter/4 => now;

290 => s.freq;
1.0 => s.gain;
quarter/4 => now;

360 => s.freq;
1.0 => s.gain;
quarter*1.5 => now;

0 => s.gain;
quarter/2 => now;
//---------------------------------------------
<<< "Fifth" >>>;

320 => s.freq;
1.0 => s.gain;
quarter*3/4 => now;

220 => s.freq;
1.0 => s.gain;
quarter/4 => now;

240 => s.freq;
1.0 => s.gain;
quarter/4 => now;

270 => s.freq;
1.0 => s.gain;
quarter/4 => now;

290 => s.freq;
1.0 => s.gain;
quarter/4 => now;

320 => s.freq;
1.0 => s.gain;
quarter/4 => now;

360 => s.freq;
1.0 => s.gain;
quarter*1.5 => now;

0 => s.gain;
quarter/2 => now;

<<< "Sixth" >>>;

360 => s.freq;
1.0 => s.gain;
quarter*3/4 => now;

240 => s.freq;
1.0 => s.gain;
quarter/4 => now;

270 => s.freq;
1.0 => s.gain;
quarter/4 => now;

305 => s.freq;
1.0 => s.gain;
quarter/4 => now;

320 => s.freq;
1.0 => s.gain;
quarter/4 => now;

360 => s.freq;
1.0 => s.gain;
quarter/4 => now;

400 => s.freq;
1.0 => s.gain;
quarter*1.5 => now;

0 => s.gain;
quarter/2 => now;
//---------------------------------
<<< "Seventh" >>>;

390 => s.freq;
1.0 => s.gain;
quarter*3/4 => now;

270 => s.freq;
1.0 => s.gain;
quarter/4 => now;

305 => s.freq;
1.0 => s.gain;
quarter/4 => now;

340 => s.freq;
1.0 => s.gain;
quarter/4 => now;

360 => s.freq;
1.0 => s.gain;
quarter/4 => now;

390 => s.freq;
1.0 => s.gain;
quarter/4 => now;

420 => s.freq;
1.0 => s.gain;
quarter*1.5 => now;

390 => s.freq;
1.0 => s.gain;
quarter/4 => now;

380 => s.freq;
1.0 => s.gain;
quarter/4 => now;

<<< "Eighth" >>>;

360 => s.freq;
1.0 => s.gain;
quarter/2 => now;

290 => s.freq;
1.0 => s.gain;
quarter/2 => now;

390 => s.freq;
1.0 => s.gain;
quarter/2 => now;

320 => s.freq;
1.0 => s.gain;
quarter/2 => now;


420 => s.freq;
1.0 => s.gain;
quarter/2 => now;

320 => s.freq;
1.0 => s.gain;
quarter/2 => now;

270 => s.freq;
1.0 => s.gain;
quarter/2 => now;

240 => s.freq;
1.0 => s.gain;
quarter/2 => now;