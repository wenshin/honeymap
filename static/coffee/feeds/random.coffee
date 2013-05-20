class Feed
  constructor: (map, log, pause) ->
    @map = map
    @log = log
    window.setInterval((=> window.setTimeout(@randomPoint, Math.random() * pause)), 2 * pause)

  randomPoint: =>
    while true
      lat = Math.random() * 180 - 90
      lng = Math.random() * 360 - 180
      marker = new Marker(@map, lat, lng)
      break if marker.regionCode
    @map.addMarker(marker)
    @log.add "New event in " + marker.regionName() + " (" + lat.toFixed(2) + ", " + lng.toFixed(2) + ")"
