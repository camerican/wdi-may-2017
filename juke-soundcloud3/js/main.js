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
// play the player for the current track
Jukebox.prototype.play = function(){
  console.log( "in play", this );
  const self = this;
  let player = this.players[this.currentSong],
      song = this.songs[this.currentSong];
  // see if we already have a player for
  // the current song...  if so, use that
  if( player ) {
    console.log( "player detected" );
    player.play();
    // to do: update the player song info
  } else {
    console.log( "no player detected" );
  // else, go and fetch a player, then play
    this.SC.stream('/tracks/'+song.id).then(function(p){
      console.log( "got player", p);
      self.players[self.currentSong] = p;
      console.log( self.players );
      self.play();
    });
  }
}
// pause the player for the current track
Jukebox.prototype.pause = function(){
  // to do: implement
}
// stop the player for current track
Jukebox.prototype.stop = function(){
  // to do: ...
}
// advance to next song
Jukebox.prototype.next = function(){
  // do too: ...
}
// go back one song
Jukebox.prototype.back = function(){
  // to do: ..
}

var myJukebox = new Jukebox();
myJukebox.addSong(new Song('45062705', 'Hotel Dennis'), new Song('223228432',"It's strange"), new Song('29366957',"Mac Miller Heat Wave"));

document.addEventListener("DOMContentLoaded",function(){
  document.querySelector('.play').addEventListener('click',function(event){
    myJukebox.play();
  });
});

// "It's strange"
// 'It\' strange'
