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
  app.map = new google.maps.Map(canvas, mapOptions)

# Backbone-ish Stuff

window.app = window.app || {}

app.templates =
  appView: '<h1>Users</h1><ul id="users"></ul>',

app.AppRouter = Backbone.Router.extend
  routes:
    '': 'index'
  initialize: (options) ->
    this.options = options
  index: () ->
    appView = new app.AppView
      collection: new app.Users()

app.AppView = Backbone.View.extend

  el: '#main'

  initialize: () ->
    this.collection.fetch()
    this.collection.on("add", this.renderUser, this)

  renderUser: (user) ->
    app.add_marker user.get('lat'), user.get('long'), user.get('name')

  render: ->
    this.collection.each = (user) ->
      this.renderUser(user)
    this

app.User = Backbone.Model.extend

  urlRoot: '/users'
  idAttribute: 'id'
  defaults:
    name: 'Gregor Kalinsky'
    email: 'gregor@gmail.com'
    address: 'Russia'

app.Users = Backbone.Collection.extend

  model: app.User
  url: '/users'

app.add_marker = (lat, long, title) ->
  latlng = new google.maps.LatLng(lat, long)
  marker = new google.maps.Marker(
    position: latlng
    map: app.map
    title: title
    )
  markers.push(marker)

$(document).ready ->
  display_map(-33.89336, 151.217167, 13)
  app.router = new app.AppRouter()
  Backbone.history.start
    pushState: true

$(document).on 'click', 'input:checkbox', ->
 $this = $(this)
 $question = $this.closest '.nested_fields_question'
 checked = $this.is ':checked'

 if checked
  $question.find('.answer_check_boxes').not(this).removeAttr("checked")
  $question.find('.answer_check_boxes').not(this).closest('.check_and_labels').fadeOut()
 else
  $question.find('.check_and_labels').fadeIn()