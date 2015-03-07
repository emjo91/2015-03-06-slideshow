alert("Javascript is working");

var current_slide = 1;

window.onload = function () {
  
  //// THIS IS CODE MESSING WITH RECEIVING THE FIRST SLIDE ////

  //var command = document.getElementById("slide1");

  function slide1() {
    var request = new XMLHttpRequest;
    request.open("get", "http://localhost:4567/slide/" + current_slide++);
    request.send();
    alert("You are on this slide:" + current_slide);
  } //end of slide1

  //command.addEventListener("click", slide1);
  
  ////THIS CODE CHANGES THE id 'content' DIV TO the first slide////
  
  // This line of code works. It sets the slide in the content div to whatever the inner html is equal to.
  var next_slide = document.getElementById("next").addEventListener("click", function(){
    document.getElementById("content").innerHTML = slide1(); 
  });
  

} //end window.onload