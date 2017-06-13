var player;
$(document).ready(function(){
  if( /visited=true/.test(document.cookie) ) {
    $('body').append("<p>Welcome back to our showcase.");
  } else {
    // first time visitor
    // set the cookie visited = true
    document.cookie = 'visited=true'
    // play some sweet tunes
    SC.initialize({
      client_id: 'fd4e76fc67798bfa742089ed619084a6'
    });
    SC.stream('/tracks/110394919').then(function(player){
      window.player = player;
      player.play();
    });
    // and show the showcase
    let fireworks = 20;
    let intervalId = setInterval(function(){
      // stop the show if we've finished our fireworks up
      if( !fireworks ) { 
        clearInterval(intervalId);
        let volControl = setInterval(function(){
          if( window.player.volume <= 0 ) { 
            clearInterval(volControl);
            window.player.pause();
          }
          window.player.volume = window.player.volume - 0.1;
        },100);
      }
      // store a reference to our new firework
      let el = $(firework());
      // append the firework to the DOM
      $('body').append(el);
      // decrease the number of available fireworks
      fireworks--;
      // wipe out our firework element after 3 seconds
      setInterval( function(){
        $(el).remove();
      }, 3000 );
    }, 100 );
  }
});

// Our firework creation function
function firework(){
  let x = Math.floor( Math.random() * innerWidth ),
      y = Math.floor( Math.random() * innerHeight ),
      color = ( f => "rgb(" + f() + ", " + f() + "," + f() + ")" )(() => Math.floor( Math.random() * 255 ));
  return "<div class='firework' style='background-color:" + color + "; top: " + y +  "px; left: " + x + "px'></div>";
}
