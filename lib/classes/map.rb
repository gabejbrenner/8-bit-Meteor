require "lib/slick.rb"

class Map
  def initialize(path)
    map = TiledMap(path)
  end