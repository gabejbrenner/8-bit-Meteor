require "lib/classes/creature.rb"
require "lib/classes/data.rb"
require "lib/Slick.rb"

class Game < BasicGame
  def init(container)
    @container = container
    @levelData = DataHandler.new("dat/", @container)
  end

  def render(container, graphics)
    @levelData.maps[0].render()
  end

  def update(container, delta)

  end
end