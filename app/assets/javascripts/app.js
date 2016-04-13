$(document).ready(function() {
  $(".new_upvote").on("click", function(event) {
    event.preventDefault();
    // /reviews/:review_id/upvotes
    // var url = "/review/" + variable + "/upvotes"
    var url = $(this).attr('href');
    debugger
    //
    updateUpvote(url);
  });
});

var updateUpvote = function(url) {
  var request = $.ajax({
    method: "POST",
    url: url,
    data: {  }
  });
};
