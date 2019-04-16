$(document).on('turbolinks:load', function() {

  // When a post is clicked, show it's full content in the modal
  $("body").on("click", ".single-post-card, .single-post-list", function() {
    const postedBy_div = $(this).find('.post-content .posted-by').html();
    const postHeading_h3 = $(this).find('.post-content h3').html();
    const postContent_p = $(this).find('.post-content p').html();
    const interested_a = $(this).find('.post-content .interested').attr('href');

    $('.modal-header .posted-by').text(postedBy_div);
    $('.loaded-data h3').text(postHeading_h3);
    $('.loaded-data p').text(postContent_p);
    $('.loaded-data .interested a').attr('href', interested_a);
    $('.myModal').modal('show');
  });
});
