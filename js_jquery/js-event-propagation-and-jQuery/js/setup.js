// These are some event handlers to make the demo work well.
// Don't change them unless you know what you're doing!

$(document).ready(function() {
  $("#reset").click(function() {
    document.location.reload();
  });

  $("form").submit(function(event) {
    event.preventDefault();
  });
});
