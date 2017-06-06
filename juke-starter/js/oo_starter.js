let player
  , elPause
  , elPlay
  , elForward;
function Song( title, artist, file ){

}
function Player( el ) {
  this.el = el;
  this.currentTrack = 0;
  this.songs = [];
}
Player.prototype.play = function(){
  this.el.play();
}
Player.prototype.pause = function(){

}


document.addEventListener("DOMContentLoaded",function(){

  player = new Player(document.querySelector("audio"));

  elPlay.addEventListener("click",function(){
    player.play();
  });

}