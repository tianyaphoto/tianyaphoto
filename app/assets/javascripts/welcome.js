$(function(){
    var $content = $('#content');
    $content.imagesLoaded(function(){
        $content.masonry({
            itemSelector : '.pane'
        });
    });
});


