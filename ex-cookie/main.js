document.addEventListener("DOMContentLoaded",function(){
  document.querySelector("form").addEventListener("submit",function(event){
    event.preventDefault();
    console.log( document.querySelector("input[name=name]").value );
    // update our cookie
    Cookies.set('name', document.querySelector("input[name=name]").value );
    updateName();
  });
  // if we have cookie set, update the h1 to say hello
  updateName();
});

function updateName() {
  var myName = Cookies.get('name');
  if( myName ) {
    document.querySelector('h1').innerText = `Hello ${myName}, so good of you to join us!`;
  }
}