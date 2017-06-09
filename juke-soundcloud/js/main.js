SC.initialize({
  client_id: 'fd4e76fc67798bfa742089ed619084a6'
});
// SC.resolve('http://soundcloud.com/forss/voca-nomen-tuum').then(function(response) {
//   // things to do after the track info loads...

//   // this should display all relevant information regarding the track
//   // e.g title, author, album art
//   console.log(response);
// });
// SC.get('/tracks/41772991').then(function(response){
//   console.log(response);
// });
//

// Sam's Band! "Road to Ruin"
// Song Title: "Not All Time Spend Idly is Wasted"
// SC.get('/tracks/301907405').then(function(response){
//   console.log(response);
// });

// SC.get('/tracks',{
//   q: 'phish'
// }).then(function(response){
//   console.log(response);
// });

// wait for the DOM to load
// listen for a submit of form#search
//    on submit:
//       grab the input[name=search] data
//       ask SoundCloud to return matching tracks
//       console.log out the tracks for now

//       to do: display the tracks in the HTML
// $(document).ready(function(){...})
document.addEventListener("DOMContentLoaded",function(){
  // $("#search").submit(function(event){...})
  document.getElementById("search").addEventListener("submit",function(event){
    event.preventDefault();
    // var term = $("#search input[name=search]").val();
    var term = document.querySelector("#search input[name=search]").value;

    SC.get('/tracks',{
      q: term
    }).then(function(response){
      //$("#results").html('');
      document.querySelector("#results").innerHTML = '';
      console.log(response);
      response.forEach(function(track){
        var template = `<li>${track.title}</li>`;
        // $("#results").append(template);
        document.querySelector("#results").innerHTML += template;
      });
      
    });
    console.log("Search term:", term);
  });
});









