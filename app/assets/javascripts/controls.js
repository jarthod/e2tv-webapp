function focus_good_link(current, row) {
  current;
  found = false;
  row.find('a').each(function() {
    var pos = $(this).offset();
    if ((pos.left + $(this).width()) > (current.offset().left + current.width()/2)) {
      $(this).focus();
      found = true;
      return false;
    }
  });
  if (!found)
    row.find('a').last().focus();
};

$().ready(function() {
  $(document.documentElement).keydown(function (event) {
    if (event.keyCode == 38 || event.keyCode == 40)  // go down
      event.preventDefault();
  });
  $(document.documentElement).keyup(function (event) {
    var current = $("*:focus")
    if (event.keyCode == 37) // go left
    {
      if (current.prev().length > 0)
        current.prev().focus();
    }
    else if (event.keyCode == 38) // go up
    {
      var section = current.closest('section');
      if (section.attr('id') == 'recent') {
        $('#search input').focus();
      } else if (section.attr('id') == 'results') {
        if (current.prev().prev().prev().length > 0)
          current.prev().prev().prev().focus();
        else
          $('#search input').focus();
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
        current.next().focus();
    }
    else if (event.keyCode == 40)  // go down
    {
      var section = current.closest('section');
      if (section.attr('id') == 'search') {
        current;
        $('#recent a, #results a').first().focus();
      } else if (section.attr('id') == 'recent') {
        focus_good_link(current, $('#tv .programs:first-child').first());
      } else if (section.attr('id') == 'results') {
        if (current.next().next().next().length > 0)
          current.next().next().next().focus();
      } else if (section.attr('id') == 'tv') {
        var program = current.closest('.programs');
        if (program.next().length > 0) {
          focus_good_link(current, program.next());
        }
      }
    }
  });

  $('#recent a, #results a').first().focus();
});