//jukebox.js
// Generate HTML Elements via a create method

// add Song
// load songs!!!
// play a song
// pause a song (toggle)
// go backwards a song
// go forwards a song
// randomize playist

function Jukebox() {
  // to do: build out the OO Jukebox!!
  this.tracks = [];
  this.currentTrack = 0;
  this.elAudio;
  this.elArtist;
  this.elSong;
}
// Accept a song or an array of songs and add them to the tracks array
Jukebox.prototype.addSong = function(song) {
  if( Array.isArray(song) && song.every( s => s instanceof Song ) ) {
    // to do: append array of songs to our tracks list
    // this.tracks = this.tracks.concat(song);
    Array.prototype.push.apply(this.tracks, song);
  } else if( song instanceof Song ) {
    this.tracks.push( song );
  } else {
    return false;
  }
  return true;
}
// Play the current song
Jukebox.prototype.play = function(){
  var currentSong = this.tracks[this.currentTrack];
  this.elAudio.src = currentSong.file;
  this.elArtist.innerText = currentSong.artist;
  this.elSong.innerText = currentSong.name;
  this.elAudio.play();
}

function Song(file, name, artist) {
  this.file = file;
  this.name = name;
  this.artist = artist;
}

// create will build out the HTML elements
// for our jukebox:
// info (artist/song) / controls (back/play/pause/forward/volume)
Jukebox.prototype.create = function(el, options ){
  // var info = document.createElement("div");
  // info.className = "info";
  // info.innerHTML = `
  //   <h3 class="name">${options.name || ""}</h3>
  //     <div class="track"><span class="artist"></span> &mdash; <span class="song"></span></div>
  // `;
  // el.appendChild(info);

  el.innerHTML = `
  <audio></audio>
  <div class="info">
      <h3 class="name">${options.name}</h3>
      <div class="track"><span class="artist"></span> &mdash; <span class="song"></span></div>
    </div>
    <div class="controls">
      <i class="back fa fa-backward fa-2x"></i>
      <i class="play-pause fa fa-pause fa-2x"></i>
      <i class="next fa fa-forward fa-2x"></i>
      <i class="random fa fa-random fa-2x"></i>
      <div class="volume"></div>
    </div> 
    `;
  this.elAudio = el.querySelector("audio");
  this.elArtist = el.querySelector(".artist");
  this.elSong = el.querySelector(".song");

  // to do: attach eventlisteners for our buttons now!
}
var player;
document.addEventListener("DOMContentLoaded",function(){
  player = new Jukebox();
  player.create(document.getElementById("jukebox"),{name: "Tunesquad Jukebox"});
  player.addSong([
    new Song("audio/revolution.mp3","Revolution","The Beatles"),
    new Song("audio/weeknd.mp3","Something","The Weeknd"),
    new Song("audio/viper.mp3","That's so Viper","Viper")
  ])
});










