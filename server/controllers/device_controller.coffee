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
        image: child.val().userinfo.pic
      })
      return false
    )
    res.render 'index', {
      devices: devices
    }
  )

deviceController.show = (req, res) ->
  firebase = new Firebase('https://takecharge.firebaseio.com/')
  firebase.child(req.params.id).once('value', (snapshot) ->
    device = snapshot.val()
    if !device.notifications
      device.notifications = []
    res.render('device', {
      device: device
    })
  )

module.exports = deviceController
