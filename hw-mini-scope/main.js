var elH1;

document.addEventListener("DOMContentLoaded",function(){
  elH1 = document.querySelector("h1");
  var addSpace = false;
  document.addEventListener("keypress",function(event){
   
    elH1.innerText += (addSpace ? " " : "") + event.key;
    
    if( event.code === "Space" ) {
      addSpace = true; // spaceCount++;
    } else {
      addSpace = false;
    }
    
    //elH1.innerText = elH1.innerText + event.key;
  });
});


// document.addEventListener("DOMContentLoaded",function(){
//   elH1 = document.querySelector("h1");
//   var spaceCount = 0;
//   document.addEventListener("keypress",function(event){
//     console.log(spaceCount, " ".repeat(spaceCount));
//     elH1.innerText += " ".repeat(spaceCount) + event.key;

//     if( event.code === "Space" ) {
//       spaceCount += 1; // spaceCount++;
//     } else {
//       spaceCount = 0;
//     }
    
//     //elH1.innerText = elH1.innerText + event.key;
//   });
// });