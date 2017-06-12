/*
 * @param id is SoundCloud assigned id
 * @param title is Song's title
 */
function Song( id, title ) {
  this.id = id;
  this.title = title;
}
function Jukebox(){
  // the following arrays are parallel 
  this.songs = []; // our Song object
  this.players = []; // the SoundCloud player object
  this.currentSong = 0;
  this.SC = SC;
  this.isRandom = false;
  this.SC.initialize({
    client_id: 'fd4e76fc67798bfa742089ed619084a6'
  });
}
// add a song to the jukebox
Jukebox.prototype.addSong = function(){
  // Array.prototype.push.apply(this.songs,arguments );
  for( let i=0; i<arguments.length; i++){
    this.songs.push( arguments[i] );
  }
}
// change the song and update the player
Jukebox.prototype.changeSong = function(i=0){
  if( this.isRandom ) {
    this.currentSong = Math.floor( Math.random() * this.songs.length );
  } else {
    this.currentSong = Math.abs(this.currentSong + this.songs.length + i) % this.songs.length;
  }
  // update player and song reference (for convenience)
  this.player = this.players[this.currentSong];
  this.song = this.songs[this.currentSong]
}

// play the player for the current track
Jukebox.prototype.play = function(){
  const self = this;

  // moved the following to changeSong()
  // let player = this.players[this.currentSong],
  //     song = this.songs[this.currentSong];

  // see if we already have a player for
  // the current song...  if so, use that
  if( this.players[this.currentSong] ) {
    this.changeSong();
    this.players[this.currentSong].play();
    // update the player song info
    document.querySelector('.track').innerHTML = this.songs[this.currentSong].title;
  } else {
    let track_id = self.currentSong;
    // else, go and fetch a player, then play
    this.SC.stream('/tracks/'+self.songs[self.currentSong].id).then(function(player){
        self.players[track_id] = player;
        self.play();
    });
  }
}
// pause the player for the current track
Jukebox.prototype.pause = function(){
  if( this.player ) {
    this.player.pause();
  }
}
// stop the player for current track
Jukebox.prototype.stop = function(){
  if( this.player ) {
    this.player.pause();
    this.player.seek(0);
  }
}
// advance to next song
Jukebox.prototype.next = function(){
  this.changeSong(1);
  this.play();
}
// go back one song
Jukebox.prototype.back = function(){
  this.changeSong(-1);
  this.play();
}
// toggle random flag
Jukebox.prototype.random = function(){
  this.isRandom = !this.isRandom;
}
var myJukebox;

document.addEventListener("DOMContentLoaded",function(){
  myJukebox = new Jukebox();
  myJukebox.addSong(new Song('45062705', 'Hotel Dennis'), new Song('223228432',"It's strange"), new Song('29366957',"Mac Miller Heat Wave"));
  
  // the lines above replace the longer block of commented out code
  ['play','pause','back','stop','next','random'].forEach( action => {
    console.log( action );
    document.querySelector('.'+action).addEventListener('click',function(event){
      console.log( myJukebox[action] );
      myJukebox[action].call(myJukebox);
    });
  });

  // document.querySelector('.play').addEventListener('click',function(event){
  //   myJukebox.play();
  // });
  // document.querySelector('.next').addEventListener('click',function(event){
  //   myJukebox.next();
  // });
  // document.querySelector('.pause').addEventListener('click',function(event){
  //   myJukebox.pause();
  // });
  // document.querySelector('.stop').addEventListener('click',function(event){
  //   myJukebox.stop();
  // });
  // document.querySelector('.back').addEventListener('click',function(event){
  //   myJukebox.back();
  // });
  // document.querySelector('.random').addEventListener('click',function(event){
  //   myJukebox.random();
  // });

});
