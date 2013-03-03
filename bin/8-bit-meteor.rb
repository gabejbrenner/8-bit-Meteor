$:.push File.expand_path('../../lib',__FILE__)
require 'Slick.rb'
require 'Game.rb'

app = AppGameContainer.new(Game.new('8-bit-meteor'))
app.set_display_mode(1300,760,false)
app.setShowFPS(true)
app.start