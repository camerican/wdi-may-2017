function typePhraseToEl( phrase, el ) {
  var index = 0;
  el.innerText = "";  //clear out the innerText of the Element
  var intervalId = setInterval(function(){
    var character = phrase[index];
    if(character == " ") character = "&nbsp;"
    el.innerHTML += character;
    index++;
    if( phrase.length <= index ) clearInterval(intervalId);
  },200);
}