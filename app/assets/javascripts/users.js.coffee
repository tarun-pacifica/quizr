# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

markers = []

showing_all_users = [
  {
    featureType: "all"
    stylers: [
      saturation: -100
    ]
  },
  {
    featureType: "road.arterial"
    elementType: "geometry"
    stylers: [
      color: "#7cdaff"
    ]
  },
  {
    featureType: "poi.business"
    elementType: 'labels'
    stylers: [
      visibility: "off"
    ]
  }
]

display_map = (lat, long, zoom) ->
  canvas = $('#map_canvas')[0]
  mapOptions =
    center: new google.maps.LatLng lat, long, 13
    zoom: zoom
    styles: showing_all_users
    visualRefresh: true
    panControl: true
    panControlOptions:
      position: google.maps.ControlPosition.RIGHT_TOP
    zoomControl: true
    zoomControlOptions:
      style: google.maps.ZoomControlStyle.LARGE
      position: google.maps.ControlPosition.RIGHT_TOP
    mapTypeControl: false
    mapTypeId: google.maps.MapTypeId.ROADMAP
  window.map = new google.maps.Map(canvas, mapOptions)

# Backbone-ish Stuff

app = app || {}

app.templates =
  appView: '<h1>Recent Posts</h1><ul id="posts"></ul>',
  blogList: '{{title}}',
  blogView: '<div class="post"><h1 class="title">{{title}}</h1><h3 class="slug">{{slug}}</h3><div class="content">{{{content}}}</div></div><div class="form"><ul class="comments"></div><div class="actual_form"></div><button class="submit">Submit</button>',
  commentList: '<li>{{twaddle}}</li>'

app = app || {}

app.AppRouter = Backbone.Router.extend
  routes:
    '': 'index'
  initialize: (options) ->
    this.options = options
  index: () ->
    appView = new app.AppView
      collection: new app.Users()

app = app || {}

app.AppView = Backbone.View.extend

  el: '#main'

  initialize: () ->
    this.$el.html(app.templates.appView)
    this.list = $('#posts')
    this.collection.fetch()
    this.collection.on("add", this.renderUser, this)

  renderUser: (user) ->
    view = new app.UserListView
      model: user
    this.list.append(view.render().el)

  render: ->
    this.collection.each = (user) ->
      this.renderUser(user)
    this

app = app || {}

app.Users = Backbone.Collection.extend

  model: app.User
  url: '/'

app = app || {}

app.User = Backbone.Model.extend

  urlRoot: '/'
  idAttribute: 'name'
  defaults:
    name: 'Gregor Kalinsky'
    email: 'gregor@gmail.com'
    address: 'Russia'

window.add_marker = (lat, long, zoom) ->
  latlng = new google.maps.LatLng(lat, long)
  marker = new google.maps.Marker(
    post: latlng
    map: map
    )

$(document).ready ->
  display_map(-33.89336, 151.217167, 13)
  app.router = new app.AppRouter()
  Backbone.history.start
    pushState: true