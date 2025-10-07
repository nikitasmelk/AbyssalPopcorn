// BEFORE PLAYING
// 1) MAKE SURE NANO IS LOADED AND CONNECTED
// 2) The piece is divided into multiple sections
// 3) Instructions for each section are provided in comments under that section.
// 4) Conductor is to guide each secti0on and transitions between sections.






// ---- SCLOrk ROLES -------------
// Player Left 1 (PL1) John
// Player Left 2 (PL2) Meir
// PL3                 Tim
// PL4                 Jason
// PX              Addison
// PR5                 Sharon
// PR6                 Irene
// PR7                 Lydia
// PR8                 Sam
// CD                  Bruno








/* glis Ndef without ~nano just in case
(
Ndef(\glis).fadeTime = 1;
Ndef(\glis, { arg freq = 100, glissTime = 2, vibrato = 1.01;
var snd;
freq = Lag.kr(freq, glissTime) * LFNoise2.kr([0.4, 0.5, 0.7, 1, 2, 5, 10]).range(1, Lag.kr(vibrato, glissTime));
snd = LFSaw.ar(freq);
snd = LPF.ar(
in: snd,
freq: freq * SinOsc.kr(1/16).range(1, 10),
mul: SinOsc.ar(1/9).range(0.2, 0.6)
);
snd = Mix.ar(snd) / snd.size;
snd = Limiter.ar(snd);
}).play;
)
*/





(
Ndef(\glis).fadeTime = 1;
Ndef(\glis, { arg freq = 100, glissTime = 2, vibrato = 1.01;
	var snd;
	freq = Lag.kr(freq, glissTime) * LFNoise2.kr([0.4, 0.5, 0.7, 1, 2, 5, 10]).range(1, Lag.kr(vibrato, glissTime));

	snd = LFSaw.ar(freq);

	snd = LPF.ar(
		in: snd,
		freq: freq * SinOsc.kr(~nano.knob(1, 1/20, 1/2, \exp)).range(1, ~nano.fader(1, 1, 20, \exp);),
		mul: SinOsc.ar(~nano.knob(2, 1/20, 20, \exp)).range(~nano.fader(2, 0.1, 0.6, \exp), 0.6)
	);

	snd = snd + BPF.ar(
		in: snd,
		freq: ~nano.knob(3, 50, 10000, \exp),
		rq: ~nano.knob(4, 0.01, 1.0, \exp),
		mul: ~nano.fader(3, 0.1, 1, \exp)
	);

	snd = Mix.ar(snd) / snd.size;
	snd = Limiter.ar(snd);
}).play;
)






/*
                        [A]
_._     _,-'""`-._                 ____()()
(,-.`._,'(       |\`-/|           /      @@
    `-.-' \ )-`( , o o)     `~~~~~\_;m__m._>o
          `-    \`_`"'-
*/

// --- INSTRUCTIONS ---
// Every player is assigned a role, either a cat or a mouse.
// The goal of the mouse is not get caught
// The goal of the cat is to catch the mouse.
// First the mices simultaneously appear by selecting any note as starting point.
// the CATS appear one by one trying to catch the mouse (by finding the same note)
// if a CAT player matches the note of the MOUSE player, they should both trigger the CATCH code and re-enter the game in about 30 seconds.
// The mouses are only allowed to change their note every 20 seconds.
// The cats                  can change their notes every 10 seconds.
// GlissTime for the mouse is shorter (2-4 seconds)
// GlissTime for the cat is longer (5-10 seconds)
// Make sure to LISTEN, CCan you tell where the mouses and the cats are?
// Only make a turn when you are confident. Sometimes it's better to wait out.
// Vibrato should be very small (1.0 - 1.02) to hear more precisely


// MOUSE CODE
// choose your own midinumber (10 - 108)
// GlissTime for the mouse is shorter (2-4 seconds)


Ndef(\glis).set(\freq, [80].choose.postln.midicps, \glissTime, 3, \vibrato, 1.0).play;


// if you get caught- trigger this AND FADE OUT     ----- CATCH CODE -------
Ndef(\glis).set(\freq, 2.midicps, \vibrato, 1.5, \glissTime, 10).play;





// CAT CODE
// GlissTime for the cat is longer (5-10 seconds)

//try to catch the mouse (10 - 108)
Ndef(\glis).set(\freq, [40].choose.postln.midicps, \glissTime, 8, \vibrato, 1.0).play;


// if you catch someone - trigger this AND FADE OUT     ----- CATCH CODE -------
Ndef(\glis).set(\freq, 2.midicps, \vibrato, 1.5, \glissTime, 10).play;






// CONDUCTOR INSTRUCTIONS

// WHEN CONDUCTOR DECIDES THE END OF THE HUNT:
// PLAYER X (PX) transitions to midinote 40 with low vibrato to begin section D
Ndef(\glis).set(\freq, [40].choose.postln.midicps, \glissTime, 15, \vibrato, 1.001).play;

// ALL other players fade-out and prepare for section D execution.







// SECTION [B] - coming soon
// SECTION [C] - coming soon









/*
                                   [D]
 :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 ::::::::::::::::::::::::::::::::.       .::::::::::::::::::::::::::::::::::::::
 :::::::::::::::::::::::::::.      ==                 ..::::::::::::::::::::::::
 :::::::::::::::::::::::..     -@@@@@@@@@@@@@@@%@@@@@       .:::::::::::::::::::
 ::::::::::::::::::::.       @@@@###%@@+%#@@@@@%@@@@@@*        .::::::::::::::::
 :::::::::::::::::.   -@@@@@@@@%%%@@@%%%#%%*#@@@@%%%#@@@@@@@@@-.::::::::::::::::
 :::::::::::::::.    :  .@@@@@@@@@@###%%@%%@@=+%@@@@@*#%@@@*    ..::::::::::::::
 ::::::::::::::   @@@@@@@@%%%@@* -#@@%%%%%%%@%@+#%###@%@=::%@@*    .::::::::::::
 ::::::::::::.  .@@@@%@%#%%%##+%@@%+%%%%%%#%#*%@%%##:+#%@@@@@@@@@@. ::::::::::::
 ::::::::::::  +@@@@#%@%%@%%%%%++#@%@@##%@%%@@@@@@@@@@@==+= %%@@@@:  .::::::::::
 :::::::::.   -@@@%%%@%%%%%%%%@@@@@%#%#%#+%%%%@ ##*+%#*%%@@@@%%%@@%. :::::::::::
 :::::       @@%#***#%%%%%%##%@%@-+@%%%%%@@@@@%+@#%@@@@%%%%#%@@@%@@@   .::::::::
 :::.  =@@@@@#*@@@@@@@##%@@%#*#%@%##*%#@%@ #+.@%@@@@%#=#%%%%%****%*@@@- .:::::::
 ::.  @@@#%%@@@%%%#%%*@%%*#%%@@*@@@%@%@@%@%@*#@@@#@@++@@%%%%@%%%%@@@@@-   .:::::
 ::.:@@@@@@@@@%@%@@@@@@@@@@@@*%%@@*@@@@=#@.*@@#@ -@@@%#%#@@%%@@@%%#%@@@@%  .::::
 ::. @@  @ = @#@#@@#% %@@@- *@@= @ %@: :-@@@   #@%@: #+@@@@#@@##@%@%@ *@@@   :::
 :::       .@@@@@%*@@@    +  @@+    -@@@-@*@-+-@#    @@@  @@@*@@@@@@@@@@@@@@ .::
 :::::.   #@@@:%+    @  :@@@#.@@@@@@   %@%#@@@@@@@@@@@-     %=* *@@@   @@@@@ .::
 :::::.=@@@@@@  @  @@ +@@.     @@@@@@@ @@+@@@.   **    @@#*@.  #: =*         :::
 :::::. @:@@+@. @:     =   ::@@     @@%@##@#    =@%@@:  +    %:      ... ...::::
 ::::::      *    .:::....:@@+. ::.  @@@@#@: ::. . -: .. .:.. ..::::::::::::::::
 ::::::::...  .:::::::::::     .:::.  @=+#@  :::... ..::::::::::::::::::::::::::
 :::::::::::::::::::::::::::::::::   @@*@%@   .:::::::::::::::::::::::::::::::::
 :::::::::::::::::::::::::::::::   .@@=@%+@@-   .:::::::::::::::::::::::::::::::
 ::::::::::::::::::::::..        @@@@:@:*@@@@@@           .:::::::::::::::::::::
 :::::::::::::::.         .@@@@@@@+@@=@@%@:@@#@@@@@@@@@@     ....:::::::::::::::
 ::::::::::.     :@@@@@@@@@*  @@@*%@@@@ @*@@+*@%.  @@-@@@@@@  .:      .:::::::::
 :::::::::::#@%@==    =@@ -@@@  -@  .  .@  +@@@@*@@@     +@@%=++.@@%@#.:::::::::
 :::::::::-:    -@*++   =-   -#@@     @+ @#@:   *:  :@:-     .-*#*    .:::::::::
 ::::::::::.:-:-  .. ...  .:    @* :=@@  -@  :@  .#+:.#*#=*:....  :-.:::::::::::
 :::::::::::........::::::::. * + :*   -*  #= %=   .      ..::......::::::::::::
 ::::::::::::::::::::::::::::+ .:: -+.. :..     .:::::::::::::::::::::::::::::::
 :::::::::::::::::::::::::::..........::::::::::::::::::::::::::::::::::::::::::
 :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

 --- INSTRUCTIONS ---
// Players have predefined roles. Their acti0ns in section D are below.

// All players are to follow the visual score below for certain cues ( D.1, D.2, etc)
// All Players start at MIDINOTE 40, NONE OR VERY LITTLE VIBRATO, MINIMAL NANO MODULATION

// All players are to follow visual instructions for their specific player.
// Visual instructions are representetive of the general movement to be executed with tools available (K6, vibrato, freq, glissTime).
// Each player needs to interpret them individiually and proceed to execute when cue is given.
// Execution code may be provided within the score for convenice. Make sure to change the code to your values

// The next cue is called by the conductor when they feel that all players have arrived at the begining of the next cue.
// A key is provided for the players to explain additional elements of the score.


// ----- KEY ---------

// MIDINOTE VALUES ARE DISPLAYED AS AN INTEGER INSIDE OF A BRACKET                     --->     [40]

// RANGES OF MIDINOTE VALUES ARE DEFINED AS TWO INTEGERS SEPARATED BY A '-'            --->     [13 - 57]

// VIBRATO IS VISUALIZED THORUGH THE CHARACTER 'Ж'. INCREMENTS ARE HIGHER VIBRATO      --->     Ж        ЖЖ       ЖЖЖ

// LINES OF DIFFERENT THICKNESS REPRESENT CHANGES IN VOLUME. THINNEST ARE LEAST HEARD. --->     ▏    ▎    ▍    ▌    ▋    ▊    ▉

//                                                                                     --->     /-----\       /------\
//                            CUES ARE PROVIDED INSIDE OF SQUARE                                | D.1 |       | D.12 |
//                                                                                              \-----/       \------/
//       IMMEDIATE FADE-OUT TO SILENCE (K6)                                            --->    v K6 v
*/



//          |--------------------------------- FREQUENCY ----- RANGE ------ SPECTRUM ---------=======----------------|

//                                                               PX
//                                                             [40]                     /-----\
//                                                                                      | D.0 |
//                                                               |                      \-----/
//                                                               |
//                                                               |
//                                                               |
//                                                               |
//                                                               |
//                                                               |
//          PL1                                                  |
//       [10 - 20]                                               |
//           |                                                   |
//           |                                                   |
//           |                                                   |
        Ndef(\glis).set(\freq, 15.midicps, \vibrato, 1.0, \glissTime, 10).play;
//           |                                                   |
//           |                                                   |                                     PR8
//           |                                                   |                                 [60 - 70]
//           |                                                   |                                     |
//           |                                                   |                                     |
//           |                                                   |                                     |
//           |                                                   |                                     |
//           |                                                   |                                     |
//           |                          PL3                      |                                     |
//           |                       [25 - 30]                   |                                     |
//           |                          |                        |                                     |
//           |                          |                        |                                     |
//           |                          |                        Ж
                                                       Ndef(\glis).set( \vibrato, 1.3, \glissTime, 5).play;
//           |                          |                        Ж                                     |
//           |                          |                        Ж          PR6                        |
//           |                          |                        Ж         [40-50]                     |
//           |                          |                        Ж           |                         |
//           |                          |                        Ж           |                         |
//           |                          |                        Ж           |                         |
//           |                          |           PL4          Ж           |                         |
//           |                          |      [30 - 35]         Ж           |                         |
//           |                          |           |            Ж           |                         |
//           |                          |           |            Ж           |                         |
//           |                          |           |            Ж           |                         |
//           |                          |           |            Ж           |                         |
//           |                          |           |            Ж           |            PR7          |
//           |                          |           |            Ж           |        [50 - 60]        |
//           |                          |           |            Ж           |            |            |
//           |                          |           |            Ж           |            |            |
//           |           PL2            |           |            Ж           |            |            |
//           |        [20 - 25]         |           |            Ж           |            |            |
//           |            |             |           |            Ж           |            |            |
//           |            |             |           |            Ж           |            |            |
//           |            |             |           |            Ж           |            |            Ж
//           |            |             |           |            Ж           |            |            Ж
//           |            |             |           |            Ж           |            |            Ж            PR9
//           |            |             |           |            ЖЖ          |            |            Ж        [70 - 80]
//           |            |             |           |           ЖЖ           |            |            Ж            |
//           |            |             |           |            ЖЖ          |            |            Ж            |
//           |            |             |           |           ЖЖ           |            |            Ж            |
//           |            |             |           |            ЖЖ          |            |            Ж            |
//           |            |             |           |           ЖЖ           |            |            Ж            |
//           |            |             |           |            ЖЖ          |            |            Ж            |
//           |            |             |           |           ЖЖ           |            |            Ж            |
//           |            |             |           |            ЖЖ          |            |            Ж            |
//           |            |             |           |           ЖЖ           |            |            Ж            |
//           |            |             |           |            ЖЖ          |            |            Ж            |
//           |            |             |           |           ЖЖ           |            |            Ж            |
//           |            |             |           |            ЖЖ          |            |            Ж            |
//           |            |             |           |           ЖЖ           |            |            Ж            |
//           |            |             |           |            Ж           |            |            |            |
//           |            |             |           |            Ж           |            |            |            |
//           |            |             |           |            Ж           |            |            |            |
//           |            |             |           |            Ж           |            |            |            |
//           |            |             |           |            Ж           |            |            |            |
//           |            |             |           |            Ж           |            |            |            |
//           |            |             |           |            Ж           |            |            |            |
//           |            |             |           |            Ж           |            |            |            |
//           |            |             |           |            |           |            |            |            |
//           |            |             |           |            |           |            |            |            |
//           |            |             |           |            |           |            |            |            |
//           |            |             |           |            |           |            |            |            |
//          PL1          PL2          PL3          PL4          PX          PR6          PR7          PR8          PR9
//           |            |            |            |            |           |             |            |            |
//           |            |            |            |            |           |             |            |            |
//           |            |            |            |            |           |  /-----\    |            |            |
//           |            |            |            |            |           |  | D.1 |    |            |            |
//           |            |            |            |            |           |  \-----/    |            |            |
//           |            |            |            |            |           |             |            |            |
                                          Ndef(\glis).set(\freq, 40.midicps, \vibrato, 1.001, \glissTime, 50).play;
//           |            |            |            |            |           |             |            |            |
//            |            |            |            |           |          |             |            |            |
//             |            |            |            |          |         |             |            |            |
//              |            |            |            |         |        |             |            |            |
//               |            |            |            |        |       |             |            |            |
//                |            |            |            |      [40]    |             |            |            |
//                 |            |            |            |      |     |             |            |            |
//                  |            |            |            |     |    |             |            |            |
 //                  |            |            |            |    |   |             |            |            |
 //                   |            |            |            |   |  |             |            |            |
 //                    |            |            |            |  | |             |            |            |
 //                     |            |            |            | ||             |            |            |
 //                      |            |            |            ||             |            |            |
 //                       |            |            |            |            |            |            |
 //                        |            |            |           |           |            |            |
 //                         |            |            |          |          |            |            |
 //                          |            |            |         |         |            |            |
 //                           |            |            |        |        |            |            |
 //                            |            |            |       |       |            |            |
 //                             |            |            |      |      |            |            |
 //                              |            |            |     |     |            |            |
 //                               |            |            |    |    |            |            |
 //                                |            |            |   |   |            |            |
 //                                 |            |            |  |  |            |            |
 //                                  |            |            | | |            |            |
//                                    |            |            [40]           |            |
 //                                    |            |            |            |            |
 //                                     |            |           |           |            |
 //                                      |            |          |          |            |
 //                                       |            |         |         |            |
 //                                        |            |        |        |            |
 //                                         |            |       |       |            |
//                                           |            |      |      |            |
//                                            |            |     |     |            |
//                                             |            |    |    |            |
//                                              |            |   |   |            |
//                                               |            |  |  |            |
//                                                |            | | |            |
//                                                 |            |||            |
//                                                  |            |            |
//                                                   |           |           |
//                                                    |          |          |
//                                                     |         |         |
//                                                      |        |        |
//                                                       |       |       |
//                                                        |      |      |
//                                                         |     |     |
//                                                          |    |    |
//                                                           |   |   |
//                                                            |  |  |
//                                                             | | |
//                                                              |||
//                                                               |
//                                                              [40]
//                                                               ▎
//                                                               ▎         /-----\
//                                                               ▎         | D.2 |
//                                                               ▎         \-----/
//                                                               ▍
//                                                               ▍
//                                                               ▍
//                                                               ▍
//                                                               ▌
//                                                               ▌
//                                                               ▌
//                                                               ▌
//                                                               ▌\
//                                                               ▋  \
//                                                               ▋   \
//                                                               ▋     \
//                                                               ▋      \
//                                                               ▊        \
//                                                               ▊        PL2
//                                                               ▊          Ж
//                                                               ▊ ~         Ж
//                                                               ▊   ~~~       Ж
//                                                               ▉       ~~~   Ж
//                                                               ▉           ~~~
//                                                               ▉             Ж ~~~
//                                                               ▉             Ж     ~~~
//                                                               ▉             Ж         PL1
//                                                               ▉             Ж             PR6
//                                                               ▉             Ж                ~
//                                                               ▉             Ж                ~
//                                                               ▉             Ж                ~
                                                Ndef(\glis).set(\freq, 67.midicps, \vibrato, 1.001, \glissTime, 10).play;
//                                                               ▉             Ж                ~
//                                                               ▉             Ж                ~
//                                                               ▉--           Ж                ~
//                                                               ▉    --       Ж                ~
//                                                               ▉        --   Ж                ~
//                                                               ▉            --                ~
//                                                               ▉             Ж    --          ~
//                                                               ▉\            Ж        --      ~
//                                                               ▉ \           Ж            --  ~
//                                                               ▉  \          Ж              --~
//                                                               ▉   \         Ж                ~ --
//                                                               ▉    \        Ж                ~     --
//                                                               ▉     \       Ж                ~         --
//                                                               ▉      \      Ж                ~             PL3
//                                                               ▉       \     Ж                ~             PR7
//                                                               ▉        \    Ж                ~              |
//                                                               ▉         \   Ж                ~              |
//                                                               ▉          \  Ж                ~              |
//                                                               ▍           \ Ж                ~              |
//                                                               ▍            \Ж                ~              |
//                                                               ▍             \                ~              |
//                                                               ▍             Ж\               ~              |
//                                                               ▍             Ж \              ~              |
//                                                               ▍             Ж  \             ~              |
//                                                               ▍             Ж   \            ~              |
//                                                               ▍             Ж    \           ~              |
//                                                               ▍             Ж     \          ~              |
//                                                               ▍             Ж     PR8        ~              |
//                                                               ▍             Ж     PR9        ~              |
//                                                               ▍             Ж      |         ~              |
//                               /-----\                         ▍             Ж      |         ~              |
//                               | D.3 |                         ▍             Ж      Ж         ~              |
//                               \-----/                         ▍             Ж      Ж         ~              |
//                                                               ▍             Ж      Ж         ~              |
//                                                               ▍             Ж      Ж         Ж              |
//                                                               ▍             Ж      Ж         Ж              |
//                                                               ▍             Ж      Ж         Ж              |
//                                                              PX▍             ЖЖ     Ж         Ж             |
//                                                               ▍            ЖЖ      Ж         Ж              |
//                                                               ▍             ЖЖ     Ж         Ж              |
//                                                               ▍            ЖЖ      Ж         Ж              |
//                                                               ▍             ЖЖ     Ж         Ж              |
//                                                               ЖЖ           ЖЖ      Ж         Ж              |
//                                                              ЖЖ             ЖЖ     Ж         Ж              |
                                                               Ndef(\glis).set( \vibrato, 1.3, \glissTime, 10).play;
//                                                               ЖЖ           ЖЖ      Ж         ЖЖ             |
//                                                              ЖЖ             ЖЖ     Ж        ЖЖ              |
//                                                               ЖЖ           ЖЖ      Ж         ЖЖ             |
//                                                              ЖЖ             ЖЖ     Ж        ЖЖ              ЖЖ
//                                                               ЖЖ           ЖЖ      Ж         ЖЖ            ЖЖ
//                                                              ЖЖ             ЖЖ     Ж        ЖЖ              ЖЖ
//                                                               ЖЖ           ЖЖ      Ж         ЖЖ            ЖЖ
//                                                              ЖЖ             ЖЖ     Ж        ЖЖ              ЖЖ
//                                                               ЖЖ           ЖЖЖ     Ж         ЖЖ            ЖЖ
//                                                              ЖЖЖ             ЖЖЖ   Ж        ЖЖ              ЖЖ
//                                                               ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ           ЖЖ
//                                                            / ЖЖЖ             ЖЖЖ   ЖЖ         ЖЖ           ЖЖ
//                                                           /    ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                                         /   ЖЖЖ             ЖЖЖ   ЖЖ         ЖЖ           ЖЖ
//                                                       /       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                                      /       ЖЖЖ             ЖЖЖ   ЖЖ         ЖЖ           ЖЖ
//                                                     /         ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                                    /         ЖЖЖ             ЖЖЖ   ЖЖ         ЖЖ           ЖЖ
//                                                  /            ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                                /             ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                              /                ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                             /                ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                            /                  ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                           /                  ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                          /                     ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                         /                     ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                        /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                       /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
                                                         Ndef(\glis).set(\freq, 15.midicps, \vibrato, 1.5, \glissTime, 10).play;
//                                      /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                     /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                    /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                   /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                  /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                                 /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                               /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                              /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                             /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                            /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                           /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                          /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                         /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                        /                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                      PL4                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                      |                       ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                      |                        ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                      |     /-----\             ЖЖЖ          ЖЖЖ    ЖЖ         ЖЖ             ЖЖ
//                      |     | D.4 |            ЖЖЖ          ЖЖЖ    PR8         ЖЖ             PL3
//                      |     \-----/             ЖЖЖ          ЖЖЖ   PR9         ЖЖ             PL7
//                      |                        ЖЖЖ          ЖЖЖ    ЖЖ         PL1             ЖЖ
//                      |                       ЖЖЖ          ЖЖЖ    ЖЖ         PR6             ЖЖ
//                      |                        PX          PL2     ЖЖ         ЖЖ             ЖЖ
//                      |                       ЖЖЖ          ЖЖЖ   v K6 v      ЖЖ             ЖЖ
//                      /                        ЖЖЖ          ЖЖЖ             ЖЖ             ЖЖ
//                     /                        ЖЖЖ          ЖЖЖ             ЖЖ             ЖЖ
//                    /                          ЖЖЖ        v K6 v           ЖЖ             ЖЖ
//                   |                          ЖЖЖ                          ЖЖ             ЖЖ
//                   |                          ЖЖЖ                          ЖЖ             ЖЖ
//                   |                          ЖЖЖ                          ЖЖ             ЖЖ
//                   |                          ЖЖЖ                          ЖЖ             ЖЖ
//                  /                           ЖЖЖ                        v K6 v           ЖЖ
//                 /                            ЖЖЖ                                         ЖЖ
//                /                             ЖЖЖ                                         ЖЖ
//               |                            v K6 v                                        ЖЖ
//               |                                                                          ЖЖ
//              /                                                                           ЖЖ
//             /                                                                            ЖЖ
//            |                                                                           v K6 v
//            |
//           PL4
//            |
//            |
//            |      /-----\
//            |      | D.5 |
//            |      \-----/
//            |
//            |
//            |
//            |
//            |
//         v K6 v








//                 THE          END         OF        FILE

                                                          