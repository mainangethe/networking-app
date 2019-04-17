$(document).on('turbolinks:load', function() {
  let isLoading = false;
  if($('.infinite-scroll', this).length > 0) {
    $(window).on('scroll', function() {
      const morePosts_url = $('.pagination a.next_page').attr('href');
      let thresholdPassed = $(window).scrollTop() > $(document).height() - $(window).height() - 60;

      if (!isLoading && morePosts_url && thresholdPassed) {
        console.log("threshold has passed: ", thresholdPassed);
        isLoading = true;
        $.getScript(morePosts_url).done(function (data, textStatus, jqxhr) {
          isLoading = false;
        }).fail(function() {
          isLoading = false;
        });
      }
    });
  }
});
