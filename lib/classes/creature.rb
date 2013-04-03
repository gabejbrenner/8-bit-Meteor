require "lib/Slick.rb"
require "lib/classes/data.rb"
require "json"

class Creature

  def initialize(map, creature)
    @map = map
    @description = JSON.parse(File.read(creature["desc_file"]))
    @startX = @desc_file["startX"]
    @startY = @desc_file["startY"]
    @spritesheetData = JSON.parse(File.read(@description["spritesheet"]))
    @spritesheet = Image.new(@spritesheetData["spritesheet"])
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