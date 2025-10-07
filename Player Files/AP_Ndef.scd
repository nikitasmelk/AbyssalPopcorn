(
Ndef(\glis).fadeTime = 1;
Ndef(\glis, {
	var snd, snd2, midinote, freq;

	midinote = ~nano.knob(8, 20, 110, \lin)
	+ (
		LFNoise2.kr([0.4, 0.5, 0.7, 1, 2, 5, 10]).range(-1, 1)
		* ~nano.knob(7, 2, 12) // vibrato RANGE (distance from center)
		* ~nano.fader(7, 0, 1) // vibrato amount (nothing to maximum)
	);

	freq = Select.kr(~nano.fader(8, 0, 4).round(1.0),
		[
			Lag.kr(midinote).midicps,
			midinote.round(1.0).midicps,
			midinote.round(3.0).midicps,
			midinote.round(7.0).midicps,
			midinote.midicps.round(100).max(50)
		]
	);

	freq.cpsmidi.poll(label: "MIDI Note");

	snd = LFSaw.ar(freq);


	snd = LPF.ar(
		in: snd,
		freq: (freq
			* SinOsc.kr(freq: ~nano.knob(1, 1/4, 4, \exp)).range(1, ~nano.fader(1, 1, 20, \exp))).min(18000),
		mul: 1
	);

	snd = BPF.ar(
		in: snd,
		freq: (freq
			* SinOsc.kr(freq: ~nano.knob(2, 1/4, 4, \exp)).range(1, ~nano.fader(2, 1, 20, \exp))).min(18000),
		rq: 1,
		mul: 1
	);


	snd = HPF.ar(
		in: snd,
		freq: (freq
			* SinOsc.kr(freq: ~nano.knob(3, 1/4, 4, \exp)).range(1, ~nano.fader(3, 1, 20, \exp))).min(18000),
		mul: 1
	);



	snd = Mix.ar(snd) / snd.size;
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\glis).stop;