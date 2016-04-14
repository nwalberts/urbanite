$(document).ready(function() {
  $(".new_upvote").on("click", function(event) {
    event.preventDefault();

    var url = $(this).parent().attr('action');
    updateUpvote(url);
  });

  $(".new_downvote").on("click", function(event) {
    event.preventDefault();

    var url = $(this).parent().attr('action');
    updateDownvote(url);
  });
});

var updateUpvote = function(url) {
  var review_id = window.location.pathname.match(/\/(\d+)$/)[1];
  var request = $.ajax({
    method: "POST",
    url: url,
    data: { review_id: review_id },
    success: function(responseData) {
      writeUpvote(responseData.id);
    },
    error: function()  {
      console.log("error!");
    }
  });
};

var writeUpvote = function(id) {
  var review_id_selector = '#review-' + id;
  var current_vote = $(review_id_selector).text();
  if (current_vote == 1) {
  $(review_id_selector).text(parseInt(current_vote) - 1);
} else if (current_vote == -1) {
    $(review_id_selector).text(parseInt(current_vote) + 2);
} else {
  $(review_id_selector).text(parseInt(current_vote) + 1);
}
};

var updateDownvote = function(url) {
  var review_id = window.location.pathname.match(/\/(\d+)$/)[1];
  var request = $.ajax({
    method: "POST",
    url: url,
    data: { review_id: review_id },
    success: function(responseData) {
      writeDownvote(responseData.id);
    },
    error: function()  {
      console.log("error!");
    }
  });
};

var writeDownvote = function(id) {
  var review_id_selector = '#review-' + id;
  var current_vote = $(review_id_selector).text();
  if (current_vote == -1) {
  $(review_id_selector).text(parseInt(current_vote) + 1);
} else if (current_vote == 1) {
    $(review_id_selector).text(parseInt(current_vote) - 2);
} else {
  $(review_id_selector).text(parseInt(current_vote) - 1);
}
};
