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

firebase = new Firebase('https://takecharge.firebaseio.com/')
firebase.on('child_added', (snapshot) ->
  if $('.device-entry[data-id=' + snapshot.key() + ']').length == 0
    template = Handlebars.compile('<div data-index="{{{index}}}" data-id="{{{id}}}" class="device-entry"><img src="{{{img}}}"><i class="fa fa-play selection" style="visibility: visible;"></i><a href="/device/{{{id}}}" class="name">{{name}}</a></div>')
    val = snapshot.val()
    $('#devices').append(template({
      index: $('.device-entry').length
      id: snapshot.key()
      img: val.userinfo.pic
      name: val.userinfo.name
    }))

    selectDevice(selectedIndex)
)