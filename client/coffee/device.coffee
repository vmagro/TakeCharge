firebase = new Firebase('https://takecharge.firebaseio.com/' + new RegExp('\/device\/(.*)\/?').exec(window.location.href)[1])

firebase.child('notifications').on('child_added', (snapshot) ->
  key = snapshot.key()
  val = snapshot.val()

  # not in the page already, add it
  if $('.notification[data-id="'+key+'"]').length == 0
    template = Handlebars.compile('<div data-id="{{{id}}}" class="notification typed"><span class="ticker-text">{{text}}</span><span class="app-name">From {{app}}</span><br></div>')
    rendered = template({
      id: key
      text: val.tickerText
      app: val.appName
    })
    $('#notifications').prepend(rendered)
)