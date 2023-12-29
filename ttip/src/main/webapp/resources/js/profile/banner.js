var mainSwiper = new Swiper(".swiper-container", {
    autoplay: {
      delay: 2000,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      type: "fraction",
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
  
  var pagingSwiper = new Swiper(".swiper-container", {
    pagination: {
      el: ".swiper-pagination2",
      type: "progressbar",
    },
  });
  
  mainSwiper.controller.control = pagingSwiper;