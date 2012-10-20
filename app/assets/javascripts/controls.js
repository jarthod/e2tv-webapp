$().ready(function() {
  $(document.documentElement).keydown(function (event) {
    if (event.keyCode == 40)  // go down
      event.preventDefault();
  });
  $(document.documentElement).keyup(function (event) {
    var current = $('.current')
    if (event.keyCode == 37) // go left
    {
      if (current.prev().length > 0)
        current.removeClass('current').prev().addClass('current').focus();
    }
    else if (event.keyCode == 38) // go up
    {
      var section = current.closest('section');
      if (section.attr('id') == 'recent') {
        current.removeClass('current');
        $('#search input').addClass('current').focus();
      }
    }
    else if (event.keyCode == 39) // go right
    {
      if (current.next().length > 0)
        current.removeClass('current').next().addClass('current').focus();
    }
    else if (event.keyCode == 40)  // go down
    {
      var section = current.closest('section');
      if (section.attr('id') == 'search') {
        current.removeClass('current');
        $('#recent a').first().addClass('current').focus();
      }
    }
  });

  $('#recent a').first().addClass('current').focus();
});