$(document).ready(function() {
  var user_lat = function () {
    var display_graph = function(userdata) {
      $('#chart').empty();
      new Morris.Bar({
        element: 'chart',
        data: userdata,
        xkey: 'name',
        ykeys:['lat'],
        labels:['Latitude']
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
      labels:['ID'],
      fillOpacity: '0.1'
    });
  };
  $.ajax({
    dataType: 'json',
    type: 'get',
    url: '/chart/user_id'
  }).done(display_graph);
};

var user_quiz_scores = function () {
  var display_graph = function(userdata) {
    $('#chart').empty();
    new Morris.Bar({
      barColors: ['green'],
      stacked: false,
      element: 'chart',
      data: userdata,
      xkey: 'name',
      ykeys:['score'],
      labels:['Scores'],
      gridTextColour: ['red']
    });
  };
  $.ajax({
    dataType: 'json',
    type: 'get',
    url: '/chart/:user_id/user_quiz_scores'
  }).done(display_graph);
};
  $('#graph_a').click(function() {
    user_lat();
    });

  $('#graph_b').click(function() {
    user_id();
  });

  $('#graph_c').click(function() {
    user_quiz_scores();
  });
user_quiz_scores();
});