require "lib/Slick.rb"
require "lib/classes/data.rb"
require "json"

class Creature

  def initialize(id, map, startX, startY)
    @x = startX
    @y = startY
    @id = id
    @map = map
    @sprite = Image.new("dat/creature/#{@id}")
  end

  def moveLeft
    unless @map.moveLeft
      @x -= 1
    end
    @state = "move"
  end

  def moveRight
    unless @map.moveRight
      @x += 1
    end
  end

  def render

  end
end