// Controll what to show.
showPart=function(id) {
  parts = [
           "#content_alarm",
           "#content_radio",
           "#content_about"
           ];
  parts.forEach(function(part) {
      if (part == id) {
        $(part).show();
      } else {
        $(part).hide();
      }
    });
}

// Set ative menu.
$(document).ready(function () {
    $('a').click(function () {
        $('.menu').find('li.active').removeClass("active");
        $(this).parents("li").addClass("active");
    });
});
