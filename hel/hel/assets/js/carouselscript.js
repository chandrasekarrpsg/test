	$('.carousel').carousel({
	  interval: 5000,
   	  pause: "false"
	})
	$('#eg1').jsScroll({
        height: '500px'
    })
	$(document).ready(function() {
	$('.fancybox').fancybox();	
	$('.fancybox-media')
	.attr('rel', 'media-gallery')
	.fancybox({
		openEffect : 'none',
		closeEffect : 'none',
		prevEffect : 'none',
		nextEffect : 'none',

		arrows : false,
		helpers : {
			media : {},
			buttons : {}
		}
	});

	});
	
$(document).ready(function(){
  $('.dropdown-submenu span').on("click", function(e){
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();
  });
});



$(function() {
        $('#vidBox').VideoPopUp({
            backgroundColor: "#17212a",
            opener: "video1",
            idvideo: "v1",
            pausevideo: false
        });
    });












