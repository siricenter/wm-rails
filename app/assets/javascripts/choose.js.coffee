$(".choose-section").hide()
  
gender = 0
floor = 0
layout = 0
aptNum = 0
mens = $("#mens-link")
womens = $("#womens-link")
floor4 = $("#floor4")
floor3 = $("#floor3")
floor2 = $("#floor2")
floor1 = $("#floor1")

womens.click ->
  gender = 1 #TODO: need to try to get this dynamically from the db
  $("#choose-gender").fadeOut()
  $("#choose-floor").fadeIn()
  return

mens.click ->
  gender = 2
  $("#choose-gender").fadeOut()
  $("#choose-floor").fadeIn()
  return

floor4.click ->
  floor = 4
  deliverFloorBlueprint(gender, floor)
  $("#choose-floor").fadeOut()
  $("#choose-apt").fadeIn()
  return

floor3.click ->
  floor = 3
  deliverFloorBlueprint(gender, floor)
  $("#choose-floor").fadeOut()
  $("#choose-apt").fadeIn()
  return

floor2.click ->
  floor = 2
  deliverFloorBlueprint(gender, floor)
  $("#choose-floor").fadeOut()
  $("#choose-apt").fadeIn()
  return

floor1.click ->
  floor = 1
  deliverFloorBlueprint(gender, floor)
  $("#choose-floor").fadeOut()
  $("#choose-apt").fadeIn()
  return

deliverFloorBlueprint = (gender, floor) ->
  htmlImgOut = ""
  htmlOverlayOut = ""
  if gender is 1
    switch floor
      when 1
        htmlImgOut = '<img src="/assets/w1f.png" alt="womens first floor plan">'
        htmlOverlayOut = '<div class="map-overlay" onclick="deliverAptBlueprint(gender, floor, 6, 106)" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" onclick="deliverAptBlueprint(gender, floor, 8, 108)" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
      when 2
        htmlImgOut = '<img src="/assets/w1f.png" alt="womens second floor plan">'
      when 3
        htmlImgOut = '<img src="/assets/w1f.png" alt="womens third floor plan">'
      when 4
        htmlImgOut = '<img src="/assets/w1f.png" alt="womens fourth floor plan">'
  else
    switch floor
      when 1
        htmlImgOut = '<img src="/assets/w1f.png" alt="mens first floor plan">'
      when 2
        htmlImgOut = '<img src="/assets/w1f.png" alt="mens second floor plan">'
      when 3
        htmlImgOut = '<img src="/assets/w1f.png" alt="mens third floor plan">'
      when 4
        htmlImgOut = '<img src="/assets/w1f.png" alt="mens fourth floor plan">'
  $("#floor-blueprint").html htmlImgOut
  $("#layout-overlays").html htmlOverlayOut
  return

deliverAptBlueprint = (gender, floor, layout, apt) ->
  $("#choose-apt").fadeOut()
  $("#choose-bed").fadeIn()
  console.log('Chose a ' + gender + ' apartment on floor ' + floor + ' with ' + layout + ' layout and apartment #' + apt + '.')
  htmlOut = ""
  if layout is 1
    switch size
      when 8
        html = '<img src="/app/assets/images/6p_floor_plan2.png" alt="floor plan">'
      when 6
        html = '<img src="/app/assets/images/6p_floor_plan2.png" alt="floor plan">'
      when 4
        html = '<img src="/app/assets/images/6p_floor_plan2.png" alt="floor plan">'
  else
    switch size
      when 8
        html = '<img src="/app/assets/images/6p_floor_plan2.png" alt="floor plan">'
      when 6
        html = '<img src="/app/assets/images/6p_floor_plan2.png" alt="floor plan">'
      when 4
        html = '<img src="/app/assets/images/6p_floor_plan2.png" alt="floor plan">'
  $("#layout-name").text "Cool Apartment"
  $(".layout-image").html htmlOut
  return