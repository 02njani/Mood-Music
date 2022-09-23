# Welcome to Sonic Pi
#Sad
#Angry
#Calming
#Scary
#Happy

set :bpm, 70
use_bpm get(:bpm)

define :drums do
  sample :bd_zome, decay: 0.2
  sleep 0.5
  2.times do
    sample :drum_cymbal_closed
    sleep 0.25
  end
  sample :drum_snare_hard, attack: 0.04
  sleep 0.5
  2.times do
    sample :drum_cymbal_closed
    sleep 0.25
  end
end

define :main do
  use_synth :beep
  play chord(:C4, :M7), release: 2
  sleep 2
  play chord(:C4, :dim7), release: 2
  sleep 2
  play_pattern_timed chord(:G3, :M7), 0.25, release: 1
  play_pattern_timed chord(:G4, :M), 0.25, release: 1
  play chord(:A4, :m7), release: 2
  sleep 1
  play chord(:F4, :M7), release: 1
  sleep 0.5
  play chord(:E4, :M7), release: 1
  sleep 0.5
end

define :epiano do
  main
  play_pattern_timed chord(:E4, :m), 0.25
  sleep 0.25
  play_pattern_timed chord(:E4, :m9), 0.25
  sleep 0.5
  play_pattern_timed chord(:E4, :m11), 0.25, release: 2
  sleep 0.25
  play :B5
end

define :echo do
  main
  play chord(:F4, :M7), release: 2
end

define :melody do
  use_synth :pretty_bell
  play :D5
  sleep 0.25
  play :B4
  sleep 0.5
  play :D5
  sleep 0.5
  piano
end

define :nextChords do
  use_synth :beep
  play chord(:G3, :M), release: 1
  sleep 1
  play chord(:G3, :M), release: 1
  sleep 1
end

define :piano do
  use_synth :piano
  play :E4
  sleep 0.125
  play :G4
  sleep 0.125
  play :E4
  sleep 0.125
  play :D4
  sleep 0.125
  play :B3
  sleep 0.125
  play :D4
  sleep 0.125
  play :E4
  sleep 0.125
  play :G4, release: 2
  sleep 0.125
end

#putting things together
2.times do
  drums
end
in_thread do
  epiano
end
in_thread do
  sleep 1
  echo
  sleep 4
  melody
end
in_thread do
  sleep 10
  piano
  sleep 4
  nextChords
end
loop do
  drums
end


