$(".team-item").each(function(){
    var width = $(this).find("img").width();
    $(".team-image-overlay").width(width);
    var height = $(this).find("img").height();
    $(".team-image-overlay").height(height);
});
$( window ).resize(function() {
    $(".team-item").each(function(){
    var width = $(this).find("img").width();
    $(".team-image-overlay").width(width);
    var height = $(this).find("img").height();
    $(".team-image-overlay").height(height);
});
});