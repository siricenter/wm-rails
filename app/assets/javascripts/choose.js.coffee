$(".choose-section").hide()
  
gender = 0
floor = 0
layout = 0
aptNum = 0
bed = ""
mens = $("#mens-link")
womens = $("#womens-link")
bkBtn = $(".bk-btn")
layoutOverlaysBldg = $("#layout-overlays-bldg")
layoutOverlaysApt = $("#layout-overlays-apt")
layoutOverlaysBed = $("#layout-overlays-bed")

bkBtn.click ->
  if bed isnt 0
    $("#choose-conf").fadeOut()
    $("#choose-bed").fadeIn()
    bed = 0
    return
  else if aptNum isnt 0
    $("#choose-bed").fadeOut()
    $("#choose-apt").fadeIn()
    aptNum = 0
    return
  else if floor isnt 0
    $("#choose-apt").fadeOut()
    $("#choose-floor").fadeIn()
    floor = 0
    return
  else if gender isnt 0
    $("#choose-floor").fadeOut()
    $("#choose-gender").fadeIn()
    gender = 0
    return

womens.click ->
  gender = 1 #TODO: need to try to get this dynamically from the db
  deliverBldgBlueprint(gender)
  $("#choose-gender").fadeOut()
  $("#choose-floor").fadeIn()
  return

mens.click ->
  gender = 2
  deliverBldgBlueprint(gender)
  $("#choose-gender").fadeOut()
  $("#choose-floor").fadeIn()
  return

layoutOverlaysBldg.on "click", "div", (event) ->
  console.log @dataset.floornum
  floor = parseInt(@dataset.floornum)
  deliverFloorBlueprint gender, floor
  $("#choose-floor").fadeOut()
  $("#choose-apt").fadeIn()
  return

layoutOverlaysApt.on "click", "div", (event) ->
  console.log @dataset.aptnum
  aptNum = @dataset.aptnum
  deliverAptBlueprint gender, floor, @dataset.layout, aptNum
  $("#choose-apt").fadeOut()
  $("#choose-bed").fadeIn()
  return

layoutOverlaysBed.on "click", "div", (event) ->
  console.log @dataset.bedlabel
  bed = @dataset.bedlabel
  $("#choose-bed").fadeOut()
  $("#choose-conf").fadeIn()
  return

deliverBldgBlueprint = (gender) ->
  htmlImgOut = ""
  htmlOverlayOut = ""
  switch gender
    when 1
      htmlImgOut = '<img src="/assets/women-exterior.png" alt="womens building">'
      htmlOverlayOut = '<div class="map-overlay floor4" data-floornum="4" style="position: absolute; top: 157px; left: 217px; width: 646px; height: 56px;"  alt="fourth floor" title="Fourth Floor" ><p>Floor 4</p></div>'
      htmlOverlayOut += '<div class="map-overlay floor3" data-floornum="3" style="position: absolute; top: 213px; left: 65px; width: 798px; height: 54px;"  alt="third floor" title="Third Floor" ><p>Floor 3</p></div>'
      htmlOverlayOut += '<div class="map-overlay floor2" data-floornum="2" style="position: absolute; top: 267px; left: 65px; width: 798px; height: 54px;"  alt="second floor" title="Second Floor" ><p>Floor 2</p></div>'
      htmlOverlayOut += '<div class="map-overlay floor1" data-floornum="1" style="position: absolute; top: 321px; left: 65px; width: 798px; height: 56px;"  alt="first floor" title="First Floor" ><p>Floor 1</p></div>'
    when 2
      htmlImgOut = '<img src="/assets/men-exterior.png" alt="womens building">'
      htmlOverlayOut = '<div class="map-overlay floor4" data-floornum="4" style="position: absolute; top: 133px; left: 59px; width: 836px; height: 59px;"  alt="fourth floor" title="Fourth Floor" ><p>Floor 4</p></div>'
      htmlOverlayOut += '<div class="map-overlay floor3" data-floornum="3" style="position: absolute; top: 192px; left: 59px; width: 836px; height: 59px;"  alt="third floor" title="Third Floor" ><p>Floor 3</p></div>'
      htmlOverlayOut += '<div class="map-overlay floor2" data-floornum="2" style="position: absolute; top: 251px; left: 59px; width: 836px; height: 59px;"  alt="second floor" title="Second Floor" ><p>Floor 2</p></div>'
      htmlOverlayOut += '<div class="map-overlay floor1" data-floornum="1" style="position: absolute; top: 310px; left: 59px; width: 836px; height: 59px;"  alt="first floor" title="First Floor" ><p>Floor 1</p></div>'
  $("#bldg-blueprint").html htmlImgOut
  $("#layout-overlays-bldg").html htmlOverlayOut
  return
      
deliverFloorBlueprint = (gender, floor) ->
  htmlImgOut = ""
  htmlOverlayOut = ""
  if gender is 1
    switch floor
      when 1
        htmlImgOut = '<img src="/assets/w1f.png" alt="womens first floor plan">'
        htmlOverlayOut = '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 430px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 430px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
      when 2
        htmlImgOut = '<img src="/assets/w2f.png" alt="womens second floor plan">'
        htmlOverlayOut = '<div class="map-overlay" data-layout="8a" data-aptnum="202" style="position: absolute; top: 19px; left: 32px; width: 219px; height: 422px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="4a" data-aptnum="204" style="position: absolute; top: 596px; left: 32px; width: 217px; height: 272px;"  alt="4 bed" title="4 bed" ><p>4 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="206" style="position: absolute; top: 714px; left: 249px; width: 339px; height: 221px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6b" data-aptnum="207" style="position: absolute; top: 461px; left: 434px; width: 340px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="208" style="position: absolute; top: 714px; left: 588px; width: 421px; height: 221px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="209" style="position: absolute; top: 461px; left: 774px; width: 343px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
      when 3
        htmlImgOut = '<img src="/assets/w3f.png" alt="womens third floor plan">'
        htmlOverlayOut = '<div class="map-overlay" data-layout="8a" data-aptnum="302" style="position: absolute; top: 10px; left: 10px; width: 220px; height: 427px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="304" style="position: absolute; top: 10px; left: 272px; width: 211px; height: 427px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="306" style="position: absolute; top: 711px; left: 228px; width: 339px; height: 219px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6b" data-aptnum="307" style="position: absolute; top: 447px; left: 413px; width: 340px; height: 221px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="308" style="position: absolute; top: 711px; left: 567px; width: 424px; height: 219px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="309" style="position: absolute; top: 447px; left: 753px; width: 343px; height: 221px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
      when 4
        htmlImgOut = '<img src="/assets/w4f.png" alt="womens fourth floor plan">'
        htmlOverlayOut = '<div class="map-overlay" data-layout="8a" data-aptnum="402" style="position: absolute; top: 12px; left: 14px; width: 221px; height: 427px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8b" data-aptnum="403" style="position: absolute; top: 12px; left: 276px; width: 220px; height: 430px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="4a" data-aptnum="404" style="position: absolute; top: 596px; left: 10px; width: 224px; height: 276px;"  alt="4 bed" title="4 bed" ><p>4 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="406" style="position: absolute; top: 711px; left: 228px; width: 344px; height: 220px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6b" data-aptnum="407" style="position: absolute; top: 449px; left: 414px; width: 344px; height: 221px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="408" style="position: absolute; top: 711px; left: 572px; width: 424px; height: 220px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="409" style="position: absolute; top: 449px; left: 758px; width: 343px; height: 221px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
  else
    switch floor
      when 1
        htmlImgOut = '<img src="/assets/w1f.png" alt="mens first floor plan">'
        htmlOverlayOut = '<div class="map-overlay" data-layout="8a" data-aptnum="202" style="position: absolute; top: 89px; left: 32px; width: 219px; height: 422px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="4a" data-aptnum="204" style="position: absolute; top: 666px; left: 32px; width: 217px; height: 272px;"  alt="4 bed" title="4 bed" ><p>4 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="206" style="position: absolute; top: 784px; left: 249px; width: 339px; height: 221px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6b" data-aptnum="207" style="position: absolute; top: 531px; left: 434px; width: 340px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="208" style="position: absolute; top: 784px; left: 588px; width: 421px; height: 221px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="209" style="position: absolute; top: 531px; left: 774px; width: 343px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
      when 2
        htmlImgOut = '<img src="/assets/w2f.png" alt="mens second floor plan">'
        htmlOverlayOut = '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
      when 3
        htmlImgOut = '<img src="/assets/w3f.png" alt="mens third floor plan">'
        htmlOverlayOut = '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
      when 4
        htmlImgOut = '<img src="/assets/w4f.png" alt="mens fourth floor plan">'
        htmlOverlayOut = '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="6a" data-aptnum="106" style="position: absolute; top: 500px; left: 225px; width: 344px; height: 211px;"  alt="6 bed" title="6 bed" ><p>6 bed</p></div>'
        htmlOverlayOut += '<div class="map-overlay" data-layout="8a" data-aptnum="108" style="position: absolute; top: 500px; left: 569px; width: 425px; height: 211px;"  alt="8 bed" title="8 bed" ><p>8 bed</p></div>'
  $("#floor-blueprint").html htmlImgOut
  $("#layout-overlays-apt").html htmlOverlayOut
  return

deliverAptBlueprint = (gender, floor, layout, apt) ->
  console.log('Chose a ' + gender + ' apartment on floor ' + floor + ' with ' + layout + ' layout and apartment #' + apt + '.')
  htmlImgOut = ""
  htmlOverlayOut = ""
  switch layout
    when '8a'
      htmlImgOut = '<img src="/assets/8ba.png" alt="8 bedroom plan a">'
      htmlOverlayOut = '<div class="map-overlay" data-bedlabel="a" style="position: absolute; top: 88px; left: 36px; width: 52px; height: 107px;"  alt="bed a" title="bed a" ><p>A</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="b" style="position: absolute; top: 88px; left: 151px; width: 52px; height: 107px;"  alt="bed b" title="bed b" ><p>B</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="c" style="position: absolute; top: 57px; left: 210px; width: 52px; height: 107px;"  alt="bed c" title="bed c" ><p>C</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="d" style="position: absolute; top: 57px; left: 325px; width: 52px; height: 107px;"  alt="bed d" title="bed d" ><p>D</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="e" style="position: absolute; top: 57Px; left: 581px; width: 52px; height: 107px;"  alt="bed e" title="bed e" ><p>E</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="f" style="position: absolute; top: 57px; left: 695px; width: 52px; height: 107px;"  alt="bed f" title="bed f" ><p>F</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="g" style="position: absolute; top: 88px; left: 755px; width: 52px; height: 107px;"  alt="bed g" title="bed g" ><p>G</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="h" style="position: absolute; top: 88px; left: 868px; width: 52px; height: 107px;"  alt="bed h" title="bed h" ><p>H</p></div>'
    when '8b'
      htmlImgOut = '<img src="/assets/8bb.png" alt="8 bedroom plan b">'
      htmlOverlayOut = '<div class="map-overlay" data-bedlabel="a" style="position: absolute; top: 88px; left: 40px; width: 52px; height: 107px;"  alt="bed a" title="bed a" ><p>A</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="b" style="position: absolute; top: 88px; left: 155px; width: 52px; height: 107px;"  alt="bed b" title="bed b" ><p>B</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="c" style="position: absolute; top: 57px; left: 214px; width: 52px; height: 107px;"  alt="bed c" title="bed c" ><p>C</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="d" style="position: absolute; top: 57px; left: 329px; width: 52px; height: 107px;"  alt="bed d" title="bed d" ><p>D</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="e" style="position: absolute; top: 57Px; left: 585px; width: 52px; height: 107px;"  alt="bed e" title="bed e" ><p>E</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="f" style="position: absolute; top: 57px; left: 699px; width: 52px; height: 107px;"  alt="bed f" title="bed f" ><p>F</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="g" style="position: absolute; top: 88px; left: 759px; width: 52px; height: 107px;"  alt="bed g" title="bed g" ><p>G</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="h" style="position: absolute; top: 88px; left: 872px; width: 52px; height: 107px;"  alt="bed h" title="bed h" ><p>H</p></div>'
    when '6a'
      htmlImgOut = '<img src="/assets/6ba.png" alt="6 bedroom plan a">'
      htmlOverlayOut = '<div class="map-overlay" data-bedlabel="a" style="position: absolute; top: 110px; left: 37px; width: 65px; height: 130px;"  alt="bed a" title="bed a" ><p>A</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="b" style="position: absolute; top: 110px; left: 179px; width: 65px; height: 130px;"  alt="bed b" title="bed b" ><p>B</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="c" style="position: absolute; top: 71px; left: 498px; width: 65px; height: 130px;"  alt="bed c" title="bed c" ><p>C</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="d" style="position: absolute; top: 71px; left: 641px; width: 65px; height: 130px;"  alt="bed d" title="bed d" ><p>D</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="e" style="position: absolute; top: 110px; left: 715px; width: 65px; height: 130px;"  alt="bed e" title="bed e" ><p>E</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="f" style="position: absolute; top: 110px; left: 857px; width: 65px; height: 130px;"  alt="bed f" title="bed f" ><p>F</p></div>'
    when '6b'
      htmlImgOut = '<img src="/assets/6bb.png" alt="6 bedroom plan b">'
      htmlOverlayOut = '<div class="map-overlay" data-bedlabel="a" style="position: absolute; top: 110px; left: 38px; width: 65px; height: 130px;"  alt="bed a" title="bed a" ><p>A</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="b" style="position: absolute; top: 110px; left: 180px; width: 65px; height: 130px;"  alt="bed b" title="bed b" ><p>B</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="c" style="position: absolute; top: 71px; left: 255px; width: 65px; height: 130px;"  alt="bed c" title="bed c" ><p>C</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="d" style="position: absolute; top: 71px; left: 397px; width: 65px; height: 130px;"  alt="bed d" title="bed d" ><p>D</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="e" style="position: absolute; top: 110px; left: 716px; width: 65px; height: 130px;"  alt="bed e" title="bed e" ><p>E</p></div>'
      htmlOverlayOut += '<div class="map-overlay" data-bedlabel="f" style="position: absolute; top: 110px; left: 858px; width: 65px; height: 130px;"  alt="bed f" title="bed f" ><p>F</p></div>'
    when '4a'
      htmlImgOut = '<img src="/assets/4ba.png" alt="4 bedroom plan a">'
  $("#bed-blueprint").html htmlImgOut
  $("#layout-overlays-bed").html htmlOverlayOut
  return