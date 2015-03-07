var current_slide = 1;

window.onload = function () {
  
  //// THIS IS CODE MESSING WITH RECEIVING THE FIRST SLIDE ////

  
  
  //// CODE FOR THE NEXT SLIDE ////

  // This line of code works. It sets the slide in the content div to whatever the inner html is equal to.
  var next_slide = document.getElementById("next").addEventListener("click", next);

  // This text changes the slide Text
  function next() {
    var request = new XMLHttpRequest;
    request.open("get", "http://localhost:4567/slide/" + current_slide++);
    request.send();
    //need to have this wait for the load...
    request.addEventListener("load", function(){
      var slide_text = JSON.parse(request.response);
    // alert("You are on this slide: " + current_slide + " " + slide_text.title);
    document.getElementById("content").innerHTML = "<h3>" + slide_text.title + "</h3>" + "<p>" + slide_text.body_text + "</p";
    })
  } //end of next 


  //// CODE FOR PREVIOUS SLIDE ////

  // This line of code works. It sets the slide in the content div to whatever the inner html is equal to.
  var previous_slide = document.getElementById("previous").addEventListener("click", previous);

  // This text changes the slide Text
  function previous() {
    var request = new XMLHttpRequest;
    request.open("get", "http://localhost:4567/slide/" + current_slide--);
    request.send();
    //need to have this wait for the load...
    request.addEventListener("load", function(){
      var slide_text = JSON.parse(request.response);
    // alert("You are on this slide: " + current_slide + " " + slide_text.title);
    document.getElementById("content").innerHTML = "<h3>" + slide_text.title + "</h3>" + "<p>" + slide_text.body_text + "</p";
    })
  } //end of next 
  

} //end window.onload