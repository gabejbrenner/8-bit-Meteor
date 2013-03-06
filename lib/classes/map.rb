require "lib/Slick.rb"

class Map
  attr_accessor :map

  def initialize(path, container)
    @map = TiledMap.new(path)
    @screenWidth = container.getScreenWidth()
    @screenHeight = container.getScreenHeight()
    @aspectRatio = self.getAspectRatio()
    @background = Image.new("dat/img/backgrounds/#{@aspectRatio}/#{@map.getMapProperty("Background", "default.png")}")
    @mapWidthPx = @map.getWidth*@map.tileWidth
    @mapHeightPx = @map.getHeight*@map.tileHeight
    @scrollX, @startXTile, @startYTile, @endXTile, @endYTile = [0, 0, 0, @map.getWidth, @map.getHeight]
  end

  def getAspectRatio()
    parts = (@screenHeight/@screenWidth.to_r).to_s.split('/')
    if parts = [5,8]
      parts = [parts[0]*2,parts[1]*2]
    else
      parts = [4,3]
    end
    "#{parts[1]}:#{parts[0]}"
  end

  def render()
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