$(document).ready(function() {
  var chart_render = function () {
    var users = ?
    $.ajax({
      dataType: 'json',
      type: 'get',
      url: '/users'
    }).done(display_graph);
  };
  var display_graph = function(userdata) {
    $('#chart').empty();
    new Morris.line({
      element: 'chart',
      data: userdata,
      xkey 'created_at',
      ykeys:['name'],
      labels:['Value']
    });
  };
chart_render;
});