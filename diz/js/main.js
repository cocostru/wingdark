$(document)['ready'](function () {
   
        $('[data-toggle=\'offcanvas\']')['on']('click touchstart', function (showme) {
            var shop = $(this)['data']('target');
            $('body')['toggleClass']('overlay');
            $(shop)['toggleClass']('offcanvas-open');
            return false
        });
        $(document)['on']('click touchstart', function (showme) {
            if ($(showme['target'])['hasClass']('navbar')) {
                $('body')['toggleClass']('overlay');
                $($(showme['target'])['find']('.navbar-offcanvas'))['toggleClass']('offcanvas-open');
                return false
            }
        });
        $('.dropdown-menu > li > a')['on']('click', function (showme) {
            if ($(this)['siblings']('.sub-menu')['length'] > 0) {
                $(this)['closest']('.dropdown')['addClass']('open');
                $(this)['parent']('li')['addClass']('has-submenu')['toggleClass']('open')
            } else {
                $(this)['parent']('li')['siblings']('li')['removeClass']('open')
            };
            return false
        });
        $(document)['on']('click', '.dropdown-megamenu .dropdown-menu', function (showme) {
            showme['stopPropagation']()
        })
  
})

$('.owl-carousel').owlCarousel({
    loop:true,
    responsiveClass:true,
margin: 60,
dots: false,
         slideBy: 4,
 navText: ["<i class='icon-chevron-left'></i>","<i class='icon-chevron-right'></i>"],
    responsive:{
        0:{
            items:6,
            nav:true
        },
        600:{
            items:6,
            nav:false
        },
        1000:{
            items:6,
            nav:true,
            loop:true
        }
    }
})

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})