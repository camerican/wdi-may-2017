let elPause
  , elPlay
  , elForward
  , elAudio
  , elVolume
  , path = 'audio/'
  , songs = [ "revolution.mp3"
    , "weeknd.mp3"
    , "viper.mp3"
    , "cash.mp3"
    , "bandofhorses.mp3"
  ]
  , currentSong = 0;
document.addEventListener("DOMContentLoaded",function(){
  elPause = document.getElementById("pause");
  elPlay = document.getElementById("play");
  elForward = document.getElementById("forward");
  elAudio = document.querySelector("audio");
  elVolume = document.getElementById("volume");

  // initialize volume slider
  noUiSlider.create(elVolume,{
    start: 0.8,
    range: {
      min: 0,
      max: 1
    }
  });

  elVolume.noUiSlider.on('slide',function(){
    // get the value of the slider
    // set the player volume to that value
    elAudio.volume = parseFloat(elVolume.noUiSlider.get());
  });

  //play player for the first time
  elAudio.src = path + songs[currentSong];
  elAudio.play();

  elPlay.addEventListener("click",function(){
    elAudio.play();
  });
  elPause.addEventListener("click",function(){
    elAudio.pause();
  });
  elForward.addEventListener("click", playNext);
  elAudio.addEventListener("ended", function(){
    playNext();
  });
});
function playNext( ) {
  console.log( this );
  currentSong = (currentSong + 1) % songs.length;
  elAudio.src = path + songs[currentSong];
  elAudio.play();
}



