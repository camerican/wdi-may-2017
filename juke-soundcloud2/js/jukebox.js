//jukebox.js
// Generate HTML Elements via a create method

// add Song
// load songs!!!
// play a song
// pause a song (toggle)
// go backwards a song
// go forwards a song
// randomize playist
var wdiJukebox
  , elSearchForm
  , elSearch;
// $(document).ready(function(){
document.addEventListener("DOMContentLoaded",function(){

  elSearchForm = document.getElementById("search");
  elSearch = elSearchForm.querySelector("input[name=search]");
  // 
  // var theThing = (function(){
  //   return myObject;
  // })();

  wdiJukebox = (function(){
    function Jukebox() {
      this.SC = SC
      this.SC.initialize({
        client_id: 'fd4e76fc67798bfa742089ed619084a6'
      });
      this.tracks = [];
      this.players = {};  // to do: add players to the players object
                          // with the track id as the key
                          // and the player as the value
      this.currentTrack = 0;
      this.el = {};
    }
    // Process Search results from user input
    Jukebox.prototype.processSearch = function(term){
      var self = this;
      console.log("Process Search:", term);
      this.SC.get('/tracks',{
        q: term
      }).then(function(response){
        console.log("SC get callback:", response);
        console.log("this:", self);
        self.addSong(response);
      });
    }

    // Accept an SC song ID and get the player stream, adding it to this.players
    Jukebox.prototype.getStream = function(index){
      var self = this
        , song = this.tracks[index];
      console.log( "tracks:", this.tracks );
      console.log( "index:", index );
      console.log( "song:", song);
      if( !self.players[song.id] ) {
        this.SC.stream('/tracks/'+song.id).then(function(player){
          // store retrieved player player
          self.players[song.id] = player;
          player.play();
          self.el.artist.innerText = song.title;
        });
      } else {
        self.players[song.id].play();
        self.el.artist.innerText = song.title;
      }
    }

    // Accept a song or an array of songs and add them to the tracks array
    Jukebox.prototype.addSong = function(song) {
      console.log("Add song: ", song);
      if( Array.isArray(song) ) {
        // to do: append array of songs to our tracks list
        // this.tracks = this.tracks.concat(song);
        Array.prototype.push.apply(this.tracks, song);
      } else {
        this.tracks.push( song );
      } 
      // Add song to the Playlist
      this.addSongToPlaylist(song);
      return true;
    }
    Jukebox.prototype.addSongToPlaylist = function( song ){
      console.log("addSongToPlaylist:", song);
      if( Array.isArray(song) ) {
        song.forEach( s => this.addSongToPlaylist(s) );
      } else {
        var index = this.tracks.reduce((acc,val,i) => val.id == song.id ? i : acc , null);
        //this.el.playlist.innerHTML += `<li data-track-id="${song.id}">${song.title}</li>`;
        this.el.playlist.innerHTML += `<li data-index="${index}">${song.title}</li>`;
      }
    }
    // Load playlist
    Jukebox.prototype.loadPlaylist = function() {
      //this.el.playlist.innerHTML = "";
      // grab results from
      this.addSongToPlaylist( this.tracks );
    }
    // Play the specified song, or the current song
    Jukebox.prototype.play = function(index){
      index = (index == undefined || index instanceof Event ) ? this.currentTrack : index;
      var currentSong = this.tracks[index];
      console.log( index, this.tracks, currentSong )
      if( this.el.play.classList.contains("fa-pause") ) { // we're paused
        this.el.audio.pause();
      } else { // we're playing
        // to do: following line resets the time on the song
        //        consider only this for loading/next function
        this.getStream(index);

      }
      this.el.play.classList.toggle("fa-play");
      this.el.play.classList.toggle("fa-pause");
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
                        <div class="info">
                        <h3 class="name">${options.name}</h3>
                        <div class="track"><span class="artist"></span> &mdash; <span class="song"></span></div>
                        </div>
                        <div class="controls">
                        <i class="back fa fa-backward fa-2x"></i>
                        <i class="play-pause fa fa-play fa-2x"></i>
                        <i class="next fa fa-forward fa-2x"></i>
                        <i class="shuffle fa fa-random fa-2x"></i>
                        <div class="volume"></div>
                        </div>
                        <ul class="playlist">
                        </ul>
                        `;
      // for convenience, store elements of interest within this.el object
      this.el.main = el;                              // main jukebox container
      this.el.artist = el.querySelector(".artist");   // artist area
      this.el.song = el.querySelector(".song");       // song area
      this.el.play = el.querySelector(".play-pause"); // play/pause toggle
      this.el.back = el.querySelector(".back");       // back button
      this.el.next = el.querySelector(".next");       // next button
      this.el.shuffle = el.querySelector(".shuffle"); // shuffle button
      this.el.volume = el.querySelector(".volume");   // volume slider
      this.el.playlist = el.querySelector(".playlist"); // playlist
      // build the noUiSlider
      noUiSlider.create(this.el.volume,{
        start: 0.8,
        range: {
          min: 0,
          max: 1
        }
      });

      this.el.volume.noUiSlider.on('slide',function(){
        // get the value of the slider
        // set the player volume to that value
        // to do: change to use SC volume
        self.SC.volume = parseFloat(self.el.volume.noUiSlider.get());
      });

      // attach eventlisteners for our buttons
      // we use our "self" variable to refer to the jukebox instance
      // since the meaning of the "this" keyword variable changes
      // to refer to the button control within the addEventListener
      this.el.play.addEventListener("click",self.play.bind(self));
      this.el.back.addEventListener("click",self.back.bind(self));
      this.el.next.addEventListener("click",self.next.bind(self));
      this.el.shuffle.addEventListener("click",self.next.bind(self));
      this.el.playlist.addEventListener("click",function(event){
        console.log(event.target, event.target.getAttribute('data-index'));
        self.getStream(event.target.getAttribute('data-index'));
      });
    }
    var player;
    player = new Jukebox();
    player.create(document.getElementById("jukebox"),{name: "Tunesquad Jukebox"});
    return player;
  })();

  elSearchForm.addEventListener("submit",function(event){
    event.preventDefault();
    console.log("Search Term:", elSearch.value);
    wdiJukebox.processSearch(elSearch.value);
  });
}); // end of DOM Content Loaded









