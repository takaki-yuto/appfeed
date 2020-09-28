$(function(){
  $(".sub-image").click(function(){
    var srcUrl = $(this).attr('src');
    var idCount = $(this).attr('id');
    console.log(idCount);
    $("#main-image").attr('src',srcUrl).hide().fadeIn();
    $(".sub-image").removeClass("active");
    $("#" + idCount).addClass("active");
  });
});

$(function(){
  $('.tabcontent > div').hide();

  $('.tabnav-a a').click(function () {
      $('.tabcontent-a > div').hide().filter(this.hash).fadeIn();

      $('.tabnav-a a').removeClass('active');
      $(this).addClass('active');

      return false;
  }).filter(':eq(0)').click();
});