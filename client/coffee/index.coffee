selectedIndex = 0

selectDevice = (index) ->
  $('.device-entry i.selection').css('visibility', 'hidden')
  $('.device-entry[data-index=' + index + '] i.selection').css('visibility', 'visible')

selectDevice(0)

$(document).keydown((e) ->
  if e.which == 38 #up
    if selectedIndex > 0
      selectedIndex--
      selectDevice(selectedIndex)
  else if e.which == 40 #down
    if selectedIndex < $('.device-entry').length - 1
      selectedIndex++
      selectDevice(selectedIndex)
  else if e.which == 13 #enter
    window.location.href = $('.device-entry[data-index=' + selectedIndex + '] a').attr('href')
  else return
  e.preventDefault
  return
)