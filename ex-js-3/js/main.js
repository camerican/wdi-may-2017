// main.js
var dPrize;
document.addEventListener("DOMContentLoaded",function(){
  dPrize = document.getElementById("prize");
  document.querySelector("main").addEventListener("click",function(event){
    event.target.classList.toggle("open");
    doorPrize(event.target.getAttribute("data-doorNum"))
  });
});
function doorPrize(doorNum){
  doorNum=parseInt(doorNum);
  if( doorNum === 1) {
    dPrize.innerText = "A new car";
  } else if( doorNum === 2) {
    dPrize.innerText = "$1Million";
  } else if( doorNum === 3) {
    dPrize.innerText = "An old shoe";
  } else {
    dPrize.innerText = "Something went very wrong";
  }
}