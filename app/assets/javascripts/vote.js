$(document).ready(function() {
  $(".new_upvote").on("click", function(event) {
    event.preventDefault();

    var url = $(this).parent().attr("action");
    updateUpvote(url);
  });

  $(".new_downvote").on("click", function(event) {
    event.preventDefault();

    var url = $(this).parent().attr("action");
    updateDownvote(url);
  });
});

var updateUpvote = function(url) {
  var reviewId = window.location.pathname.match(/\/(\d+)$/)[1];
  $.ajax({
    method: "POST",
    url: url,
    data: { review_id: reviewId },
    success: function(responseData) {
      writeUpvote(responseData.id);
    },
    error: function()  {
      alert("error!");
    }
  });
};

var writeUpvote = function(id) {
  var reviewIdSelector = '#review-' + id;
  var currentVote = $(reviewIdSelector).text();
  if (currentVote == 1) {
  $(reviewIdSelector).text(parseInt(currentVote) - 1);
} else if (currentVote == -1) {
    $(reviewIdSelector).text(parseInt(currentVote) + 2);
} else {
  $(reviewIdSelector).text(parseInt(currentVote) + 1);
}
};

var updateDownvote = function(url) {
  var reviewId = window.location.pathname.match(/\/(\d+)$/)[1];
  $.ajax({
    method: "POST",
    url: url,
    data: { review_id: reviewId },
    success: function(responseData) {
      writeDownvote(responseData.id);
    },
    error: function()  {
      alert("error!");
    }
  });
};

var writeDownvote = function(id) {
  var reviewIdSelector = "#review-" + id;
  var currentVote = $(reviewIdSelector).text();
  if (currentVote == -1) {
  $(reviewIdSelector).text(parseInt(currentVote) + 1);
} else if (currentVote == 1) {
    $(reviewIdSelector).text(parseInt(currentVote) - 2);
} else {
  $(reviewIdSelector).text(parseInt(currentVote) - 1);
}
};
