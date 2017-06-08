const PATH = 'http://art-share.herokuapp.com/api/v1/';

document.addEventListener("DOMContentLoaded",function(){
  checkLogin();
  // load users
  updateUserList();
});

function updateUserList(){
  $.ajax({
    type: "GET",
    url: PATH + "users/",
    success: function(data){
      $("#users").children().unbind();
      $("#users").html('');
      data.result.forEach(person => {
        $("#users").append(`
          <li data-id="${person.id}"><span class="fname">${person.fname}</span><span class="lname">${person.lname}</span> (<span class="email">${person.email}</span>) <span class="view-paintings">View Paintings</span> <span class="destroy">Destroy User</span></li>
        `);
      });
      $(".destroy").click(function(event){
        var id = $(event.target).parent().attr('data-id');
        $.ajax({
          type: "DELETE",
          url: `${PATH}users/${id}`,
          success: function(){
            updateUserList();
          }
        });
      });
      console.log( data );
    }
});
}

function checkLogin(){
  $.ajax({
    type: "GET",
    url: PATH+"sessions/",
    success: function(data){
      // if we're not logged in
      if( !data.result ) {
        $("#status").html(
        `<h2>Log In</h2>
          <form id="login">
            <input name="email" placeholder="Email" /><br />
            <input name="password" type="password" placeholder="Password"><br />
            <input type="submit" value="Login" />
          </form>
          <h4>or</h4>
          <h2>Register</h2>
          <form id="register">
            <input name="fname" placeholder="First Name"/><br />
            <input name="lname" placeholder="Last Name"/><br />
            <input name="email" placeholder="Email" /><br />
            <input name="password" placeholder="Password"><br />
            <input type="submit" value="Login" />
          </form>`);
        $("#register").submit(function(e){
          e.preventDefault();
          $.ajax({
            type: "POST",
            url: PATH+"users/",
            data: {
              user: {
                fname: $("[name=fname]","#register").val(),
                lname: $("[name=lname]","#register").val(),
                password: $("[name=password]","#register").val(),
                email: $("[name=email]","#register").val()
              }
            }, success: function(data){
              //update logged in status
              console.log(data)
            }
          })
        });
        $("#login").submit(function(e){
          e.preventDefault();
          $.ajax({
            type: "POST",
            url: PATH+"sessions/new",
            data: {
              email: $("[name=email]","#login").val(),
              password: $("[name=password]","#login").val()
            },
            success: function(data){
              console.log(data);
              updateLogin(data.result);
            }
          });
        });
      } else {

        $("#status").html(data.result);
      }
      console.log(data);
    }
  });
}
function updateLogin(user){
  // remove other click listeners on status
  $("#status").children().unbind();
  $("#status").html(
    `<h4>${user.email}</h4>
    <button id="logout">Logout</button>
    `);
  $("#logout").click(logout);
}
function logout(){
  $.ajax({
    type: "GET",
    url: PATH + "sessions/destroy",
    success: checkLogin
  })
}
//http://www.arsenal.com/assets/_files/scaled/456x257/apr_17/gun__1491430610_MO.jpg

// $.ajax({
//   type: "POST",
//   url: "http://art-share.herokuapp.com/api/v1/users/10420/paintings/",
//   data:{
//     painting: {
//       image_url: "http://www.arsenal.com/assets/_files/scaled/456x257/apr_17/gun__1491430610_MO.jpg",
//       name: "Mesut Özil"
//     }
//   },
//   success: function(data){
//     console.log(data);
//   }
// })

// $.ajax({
//   type: "GET",
//   url: "/api/v1/users/10420/paintings/",

// });

