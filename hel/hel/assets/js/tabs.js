$(document).ready(function() {
    $(".yearstabls a").click(function(event) {
        event.preventDefault();
        $(this).parent().parent().addClass("current");
        $(this).parent().parent().siblings().removeClass("current");;
        var tab = $(this).attr("href");
        $(".ecrepyear").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
     $(".clstab a").click(function(event) {
        event.preventDefault();
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");;
        var tab = $(this).attr("href");
        //$(".ecrepyear").not(tab).css("display", "none");
        //$(tab).fadeIn();
    });
   $(".tabeleftside a").click(function(event) {
    event.preventDefault();
    $(this).parent().addClass("currenta");
    $(this).parent().siblings().removeClass("currenta");;
    var tab = $(this).attr("href");
});
});