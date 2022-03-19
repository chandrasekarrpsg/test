    $(document).ready(function(){
    $('#video1').click(function(){
    $('#vidBox').toggleClass('show');
    });
    $('#closer_videopopup').click(function(){
    $('#vidBox').removeClass('show');
    });
    });
    var ppbutton = document.getElementById("video1");
ppbutton.addEventListener("click", playPause);
myVideo = document.getElementById("v1");
function playPause() { 
    if (myVideo.paused) {
        myVideo.play();
        //ppbutton.innerHTML = "Pause";
        }
    else  {
        myVideo.pause(); 
        //ppbutton.innerHTML = "Play";
        }
        
 }       
        function pauseVid() { 
  myVideo.pause(); 
} 