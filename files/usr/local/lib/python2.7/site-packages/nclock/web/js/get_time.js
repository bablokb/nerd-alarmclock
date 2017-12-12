$(document).ready(function() {
    $.ajax({
        url: "/time"
    }).then(function(data) {
        $('.time').append(data.time);
    });
});
