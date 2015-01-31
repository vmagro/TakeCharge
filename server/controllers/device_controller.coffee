Firebase = require 'firebase'

deviceController = {}

deviceController.index = (req, res) ->
  firebase = new Firebase('https://takecharge.firebaseio.com/')
  firebase.once('value', (snapshot) ->
    devices = []
    snapshot.forEach((child) ->
      devices.push({
        id: child.key()
        name: child.val().userinfo.name
      })
    )
    res.render 'index', {
      devices: devices
    }
  )

deviceController.show = (req, res) ->
  res.send('show ' + req.params.id)
  res.end()

module.exports = deviceController
