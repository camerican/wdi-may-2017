// we want to replace the h1 inner content with text:
// Please join the <em>TuneSquad</em> Mailing list
let elH1
  , elForm
  , elEmail;

document.addEventListener("DOMContentLoaded",function(){
  elH1 = document.querySelector("h1");
  elForm = document.querySelector("form");
  elEmail = elForm.querySelector("input[name=email]");
  elH1.addEventListener("click",function(){
    // to do: change the innerText value...
    elH1.innerText = "Please join the <em>TuneSquad</em> Mailing list";
  });

});