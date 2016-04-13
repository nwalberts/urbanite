$(document).ready(function() {
  $("#upvote").on("submit", function(event) {
    event.preventDefault();
    debugger

    updateUpvote();
  });
});

var updateUpvote = function(vote) {
  var url = $(this).attr('href');
  var request = $.ajax({
    method: "PUT",
    url: url,
    data: {  }
  });

  // request.done(function() {
  //
  // })
}

// different ids for different types of upvotes
