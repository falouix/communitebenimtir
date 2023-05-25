//----------------------
// WINDOW READY FUCNTION
//----------------------

$(document).ready(function() {

    // Init Fuctions

    owlSlider();

});

// Owl Slider
function owlSlider() {

    (function($) {

        "use strict";

        if ($('.owl-carousel').length) {

            $(".owl-carousel").each(function(index) {

                var autoplay = $(this).data('autoplay');

                var timeout = $(this).data('delay');

                var slidemargin = $(this).data('margin');

                var slidepadding = $(this).data('stagepadding');

                var items = $(this).data('items');

                var animationin = $(this).data('animatein');

                var animationout = $(this).data('animateout');

                var itemheight = $(this).data('autoheight');

                var itemwidth = $(this).data('autowidth');

                var itemmerge = $(this).data('merge');

                var navigation = $(this).data('nav');

                var pagination = $(this).data('dots');

                var infinateloop = $(this).data('loop');

                var itemsdesktop = $(this).data('desktop');

                var itemsdesktopsmall = $(this).data('desktopsmall');

                var itemstablet = $(this).data('tablet');

                var itemsmobile = $(this).data('mobile');

                $(this).on('initialized.owl.carousel changed.owl.carousel', function(property) {

                    var current = property.item.index;

                    $(property.target).find(".owl-item").eq(current).find(".animated").each(function() {

                        var elem = $(this);

                        var animation = elem.data('animate');

                        if (elem.hasClass('visible')) {

                            elem.removeClass(animation + ' visible');

                        }

                        if (!elem.hasClass('visible')) {

                            var animationDelay = elem.data('animation-delay');

                            if (animationDelay) {

                                setTimeout(function() {

                                    elem.addClass(animation + " visible");

                                }, animationDelay);

                            } else {

                                elem.addClass(animation + " visible");

                            }

                        }

                    });

                }).owlCarousel({

                    autoplay: autoplay,

                    autoplayTimeout: timeout,

                    items: items,

                    margin: slidemargin,

                    autoHeight: itemheight,

                    animateIn: animationin,

                    animateOut: animationout,

                    autoWidth: itemwidth,

                    stagePadding: slidepadding,

                    merge: itemmerge,

                    nav: navigation,

                    dots: pagination,

                    loop: infinateloop,

                    responsive: {

                        479: {

                            items: itemsmobile,

                        },

                        768: {

                            items: itemstablet,

                        },

                        980: {

                            items: itemsdesktopsmall,

                        },

                        1199: {

                            items: itemsdesktop,

                        }

                    }

                });

            });

        }

    })(jQuery);

}