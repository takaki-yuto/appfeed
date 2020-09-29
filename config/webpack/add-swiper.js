$(function() {
  consolelog("OK");
  new Swiper('.swiper-container', {

      // Optional parameters
      direction: 'vertical',
      loop: true,

      pagination: {
          el: '.swiper-pagination',
      },
  });
});