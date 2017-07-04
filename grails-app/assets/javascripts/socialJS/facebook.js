function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
        testAPI();
    } else {
        document.getElementById('status').innerHTML = 'Please log ' +
            'into this app.';
        document.getElementById('fbimage').style.display='none';
    }
}

function checkLoginState() {
    FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
    });
}

window.fbAsyncInit = function() {
    FB.init({
        appId      : '1075108182604407',
        cookie     : true,  // enable cookies to allow the server to access session
        xfbml      : true,
        version    : 'v2.8' // use graph api version 2.8
    });
    FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
    });
};

// Load the SDK asynchronously
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
    FB.api(
        '/me?fields=email,name,id,link', function(response) {
        profile_pic =  "http://graph.facebook.com/"+response.id+"/picture";
        console.log('Successful login for: ' + response.name);
        document.getElementById('status').innerHTML =
            "You are already logged in with Facebook -" +
            "<a href=https://www.facebook.com/"+response.id+">" + response.name +"</a>" +
            "! But not login with our website. Now you can either sign up or login with us.";
        document.getElementById('fbi').innerHTML="<img src='"+profile_pic+"'/>";
        document.getElementById('fbi').className="";
        document.getElementById('f').style.display='none';
        document.getElementById('fn').innerHTML=response.name;
        document.getElementById('userName').value=response.id;
        document.getElementById('emailId').value=response.email;
        document.getElementById('fullName').value=response.name;
        document.getElementById('homePage').value=response.link;
        document.getElementById('password').value=response.id;

        }

    );
}