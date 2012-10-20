// Wrap this function in a closure so we don't pollute the namespace
$().ready(function() {
  function worker() {
    if ($('#recent').length) {
      $.get('programs/torrent', function(data) {
        // Now that we've completed the request schedule the next one.
        var current = $("*:focus");
        var section = current.closest('section');
        var tid;
        if (section.attr('id') == 'recent')
          var tid = current.attr('id');
        console.log(tid);
        $('#recent').html(data);
        if (section.attr('id') == 'recent')
          $("#" + tid).focus();
        setTimeout(worker, 5000);
      });
    }
  };
  setTimeout(worker, 5000);
});