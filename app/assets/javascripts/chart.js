$(document).ready(function() {
  var user_lat = function () {
    var display_graph = function(userdata) {
      $('#chart').empty();
      new Morris.Bar({
        element: 'chart',
        data: userdata,
        xkey: 'name',
        ykeys:['lat'],
        labels:['Value']
      });
    };
    $.ajax({
      dataType: 'json',
      type: 'get',
      url: '/chart/user_lat'
    }).done(display_graph);
  };

var user_id = function () {
  var display_graph = function(userdata) {
    $('#chart').empty();
    new Morris.Bar({
      barColors: ['red'],
      stacked: false,
      element: 'chart',
      data: userdata,
      xkey: 'name',
      ykeys:['id'],
      labels:['ID']
    });
  };
  $.ajax({
    dataType: 'json',
    type: 'get',
    url: '/chart/user_id'
  }).done(display_graph);
};

$('#graph_a').click(function() {
  console.log('AA');
  user_lat();
  });

$('#graph_b').click(function() {
  console.log('BB');
  user_id();
});

});