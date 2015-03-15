var current_slide = 0;

// This doesn't work


window.onload = function () {
  
  //// THIS IS CODE MESSING WITH RECEIVING THE FIRST SLIDE ////
  
  
  //// CODE FOR THE NEXT SLIDE ////

  // This line of code works. It sets the slide in the content div to whatever the inner html is equal to.
  var next_slide = document.getElementById("next").addEventListener("click", next);

  // This text changes the slide Text
  function next() {
    current_slide++
    if (current_slide > 10) {
      current_slide = 1;
    } else {
      var request = new XMLHttpRequest;
      request.open("get", "http://localhost:4567/slide/" + current_slide);
      request.send();
      //need to have this wait for the load...
      request.addEventListener("load", function(){
        var slide_text = JSON.parse(request.response);
      document.getElementById("content").innerHTML = "<h3>" + slide_text.title + "</h3>" +
        "<p>" + slide_text.body_text + "</p>";
      });
    };
  } //end of next 


  //// CODE FOR PREVIOUS SLIDE ////

  // This line of code works. It sets the slide in the content div to whatever the inner html is equal to.
  var previous_slide = document.getElementById("previous").addEventListener("click", previous);

  // This text changes the slide Text
  function previous() {
    current_slide--
    //would eventually want to make this more dynanimc.
    if (current_slide < 1) {
      current_slide = 10;
    } else {
      var request = new XMLHttpRequest;
      request.open("get", "http://localhost:4567/slide/" + current_slide);
      request.send();
      //need to have this wait for the load...
      request.addEventListener("load", function(){
        var slide_text = JSON.parse(request.response);
      document.getElementById("content").innerHTML = "<h3>" + slide_text.title + "</h3>" + 
        "<p>" + slide_text.body_text + "</p>";
      });
    };
  } //end of next 

} //end window.onload

//// ATTEMPT TO DRY THINGS UP ////

