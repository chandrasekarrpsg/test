$(document).ready(function() {
  var owl = $('.newcarocel');
  owl.owlCarousel({
    margin: 0,
    nav: true,
    loop: true,
    responsive: {
      0: {
        items: 1
      },
      575: {
        items: 2
      },
      900: {
        items: 2
      },
      1000: {
        items: 3
      }
    }
  })
  var owl = $('.yearstabls .owl-carousel');
  owl.owlCarousel({
    margin: 0,
    nav: true,
    loop: true,
    responsive: {
      0: {
        items: 2
      },
      575: {
        items: 4
      },
      800: {
        items: 5
      },
      900: {
        items: 8
      },
      1300: {
        items: 10
      }
      
    }
  })
})