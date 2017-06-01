document.addEventListener("DOMContentLoaded",function(){
  elAnimation = document.getElementById("animation");
  document.getElementById("states").addEventListener("change",function(event){
    elAnimation.className = event.target.value;
  });
});