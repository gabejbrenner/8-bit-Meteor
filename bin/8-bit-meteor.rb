$:.push File.expand_path('../../lib',__FILE__)
require 'Slick.rb'
require 'Game.rb'

app = AppGameContainer.new(Game.new('8-bit-meteor'))
app.setDisplayMode(app.getScreenWidth, app.getScreenHeight, true)
app.setShowFPS(true)
app.start