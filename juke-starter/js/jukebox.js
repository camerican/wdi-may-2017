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
  this.el = {};
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
  // determine whether we're played or paused
  this.el.audio.src = currentSong.file;
  this.el.artist.innerText = currentSong.artist;
  this.el.song.innerText = currentSong.name;
  this.el.audio.play();
  console.log("Playing");
}
// Go back a song & play
Jukebox.prototype.back = function(){
  // to do: go back a song
}
// Go forward a song & play
Jukebox.prototype.next = function(){
  // to do: go forward a song
}
// Play futured songs in shuffled order
Jukebox.prototype.shuffle = function(){
  //
}
function Song(file, name, artist) {
  this.file = file;
  this.name = name;
  this.artist = artist;
}

// create will build out the HTML elements
// for our jukebox:
// info (artist/song) / controls (back/play/pause/forward/volume)
Jukebox.prototype.create = function(el, options){
  let self = this;  // let's copy our reference to the jukebox instance
                    // into a "self" variable we can use for our event listeners
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
      <i class="shuffle fa fa-random fa-2x"></i>
      <div class="volume"></div>
    </div> 
    `;
  // for convenience, store elements of interest within this.el object
  this.el.main = el;                              // main jukebox container
  this.el.audio = el.querySelector("audio");      // audio tag
  this.el.artist = el.querySelector(".artist");   // artist area
  this.el.song = el.querySelector(".song");       // song area
  this.el.play = el.querySelector(".play-pause"); // play/pause toggle
  this.el.back = el.querySelector(".back");       // back button
  this.el.next = el.querySelector(".next");       // next button
  this.el.shuffle = el.querySelector(".shuffle"); // shuffle button
  // attach eventlisteners for our buttons
  // we use our "self" variable to refer to the jukebox instance
  // since the meaning of the "this" keyword variable changes
  // to refer to the button control within the addEventListener
  this.el.play.addEventListener("click",self.play.bind(self));
  this.el.back.addEventListener("click",self.back.bind(self));
  this.el.next.addEventListener("click",self.next.bind(self));
  this.el.shuffle.addEventListener("click",self.next.bind(self));
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










