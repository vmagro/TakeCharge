express = require 'express'

ASSET_BUILD_PATH = 'server/client_build/development'
PORT = process.env.PORT ? 3000
SESSION_SECRET = process.env.SESSION_SECRET ? 'keyboard kitty'
WHITELISTED_URLS = ['/login', '/signup', '/favicon.ico']

# controllers
deviceController = require './server/controllers/device_controller'

app = express()
app.configure ->
  # jade templates from templates dir
  app.use express.compress()
  app.set 'views', "#{__dirname}/server/templates"
  app.set 'view engine', 'jade'
  
  # serve static assets
  app.use('/assets', express.static("#{__dirname}/#{ASSET_BUILD_PATH}"))
  
   
  # logging
  app.use express.logger()
  
# public routes
app.get '/', deviceController.index
app.get '/device/:id', deviceController.show

 
module.exports = app
