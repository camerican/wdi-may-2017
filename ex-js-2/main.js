// var num1 = 9;
// var num2 = 14;
// var cam;

var num1 = 9
  , num2 = 14
  , sum = num1 + num2
  , string1 = "Hello"
  , string2 = "It's Taco Tuesday"
  , me = {
    firstName: "Cam",
    lastName: "Crews",
    birthday: NaN,
    interests: [
      "Tennis",
      "Programming",
      "Eating Lunch",
      "Golf",
      "Arsenal"
    ]
  };
  // , age = parseInt(prompt( 'How old are you?' ));

// if( age < 21 ) {
//   window.location = "http://disney.com";
// }

// console.log( num1 + num2 );
console.log( sum );

for( var attribute in me ) {
  console.log( attribute + " " + me[attribute] );
}

for(var i=0; i < me.interests.length; i += 1 ) {
  console.log( me.interests[i] );
}

// Declare a function that takes a string as argument
// and logs it out

function sayHello( name ) {
  console.log( "Hi " + name + "!" );
}
sayHello(prompt("Tell me your name"));


function howMuchDoILoveJavaScript() {
  console.log("I " + "love ".repeat(Math.floor(Math.random()*10+2)) + "JavaScript!");
}
howMuchDoILoveJavaScript();
// console.log( me.interests[0] );
// console.log( me.interests[1] );
// console.log( cam );

// cam = "Instructor";
// var cam = "Instructor";

// alert( '' + num1 + num2 );
// alert( string1 + ' ' + string2 );
// alert( `${string1} ${string2}` );