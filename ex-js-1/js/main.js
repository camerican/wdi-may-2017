
// We want to take action when the user submits the form.  So, when the user submits the form:

// we want to get the value out of num1 and num2

// we want to interpret the values as Numbers instead of Strings

// we want to add them together and return the result to the span#result
var dNum1, dNum2, dResult;

document.addEventListener("DOMContentLoaded",function(){
  dNum1 = document.querySelector('input[name=num1]');
  dNum2 = document.querySelector('input[name=num2]');
  dResult = document.getElementById("result");
  document.getElementById("adderForm").addEventListener("submit",function(event){
    // to do: the rest of the steps
    event.preventDefault();
    dResult.innerText = parseInt(dNum1.value) + parseInt(dNum2.value);
    console.log( dNum1.value + " " + dNum2.value );
  });
});