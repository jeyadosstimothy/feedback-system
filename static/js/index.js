$(document).ready(function(){
  $(".form-wrapper .button").click(function(){
    var button = $(this);
    var currentSection = button.parents(".section");
    var currentSectionIndex = currentSection.index();
    var headerSection = $('.steps li').eq(currentSectionIndex);
    currentSection.removeClass("is-active").next().addClass("is-active");
    headerSection.removeClass("is-active").next().addClass("is-active");
    if(currentSectionIndex === 1){
      setTimeout(function () { document.getElementById('login').submit(); }, 2000);
    }
  });
  $('#feedbackSubmit').click(function(){
    document.getElementById('submit').click();
  });
});
