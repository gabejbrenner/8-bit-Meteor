require "lib/Slick.rb"

class Map
  attr_accessor :map

  def initialize(path, container)
    @map = TiledMap.new(path)
    @screenWidth = container.getScreenWidth()
    @screenHeight = container.getScreenHeight()
    @mapWidthPx = @map.getWidth*@map.tileWidth
    @mapHeightPx = @map.getHeight*@map.tileHeight
    @scrollX, @startXTile, @startYTile, @endXTile, @endYTile = [0, 0, 0, @map.getWidth, @map.getHeight]
  end

  def render()
    puts @map.getMapProperty("Background","dat/img/default.png")
    @map.render(@scrollX, @screenHeight-@mapHeightPx, @startXTile, @startYTile, @endXTile, @endYTile)
  end

  def canMoveLeft()
    @scrollX == 0
  end

  def canMoveRight()
    @scrollX < (@mapWidthPx/@screenWidth)
  end

  def moveRight()
    @scrollX += 1
  end

  def moveLeft()
    @scrollX -= 1
  end
end