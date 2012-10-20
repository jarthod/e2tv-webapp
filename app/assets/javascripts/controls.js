function focus_good_link(current, row) {
  current.removeClass('current');
  found = false;
  row.find('a').each(function() {
    var pos = $(this).offset();
    if ((pos.left + $(this).width()) > (current.offset().left + current.width()/2)) {
      $(this).addClass('current').focus();
      found = true;
      return false;
    }
  });
  if (!found)
    row.find('a').last().addClass('current').focus();
};

$().ready(function() {
  $(document.documentElement).keydown(function (event) {
    if (event.keyCode >= 37 && event.keyCode <= 40 )  // go down
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
      } else if (section.attr('id') == 'tv') {
        var program = current.closest('.programs');
        if (program.prev().length > 0) {
          focus_good_link(current, program.prev());
        } else {
          focus_good_link(current, $('#recent'));
        }
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
      } else if (section.attr('id') == 'recent') {
        focus_good_link(current, $('#tv .programs:first-child').first());
      } else if (section.attr('id') == 'tv') {
        var program = current.closest('.programs');
        if (program.next().length > 0) {
          focus_good_link(current, program.next());
        }
      }
    }
  });

  $('#recent a').first().addClass('current').focus();
});