SndBuf sample => dac;

me.dir() => string path; 

hearSample(sample, path + "audio/clap_01.wav"); 
hearSample(sample, path + "audio/click_01.wav"); 
hearSample(sample, path + "audio/click_02.wav"); 
hearSample(sample, path + "audio/cowbell_01.wav"); 
hearSample(sample, path + "audio/hihat_01.wav"); 
hearSample(sample, path + "audio/hihat_04.wav"); 
hearSample(sample, path + "audio/kick_01.wav"); 
hearSample(sample, path + "audio/snare_01.wav"); 
hearSample(sample, path + "audio/snare_02.wav"); 
hearSample(sample, path + "audio/snare_03.wav"); 
hearSample(sample, path + "audio/stereo_fx_01.wav"); 
hearSample(sample, path + "audio/stereo_fx_03.wav"); 

fun void hearSample(SndBuf sample, string where) {
    where => sample.read;
    0 => sample.pos;
    second => now;
}