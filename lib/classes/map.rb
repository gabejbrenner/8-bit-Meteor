require "lib/Slick.rb"
require "json"

class Map
  attr_accessor :map, :pop

  def initialize(path, container)
    @map = TiledMap.new(path)
    @pop = JSON.parse(File.read("dat/pop/#{@map.getMapProperty("pop", "0.pop")}"))
    @id = @map.getMapProperty("id", "0")
    @screenWidth = container.getScreenWidth
    @screenHeight = container.getScreenHeight
    @aspectRatio = self.getAspectRatio
    @background = Image.new("dat/img/backgrounds/#{@aspectRatio}/#{@map.getMapProperty("background", "default.png")}")
    @mapWidthPx = @map.getWidth*@map.tileWidth
    @mapHeightPx = @map.getHeight*@map.tileHeight
    @scrollX, @startXTile, @startYTile, @endXTile, @endYTile = [0, 0, 0, @map.getWidth, @map.getHeight]
  end

  def getAspectRatio
    parts = (@screenWidth/@screenHeight.to_r).to_s.split('/')
    if parts == [8,5]
      parts = [parts[0]*2,parts[1]*2]
    else
      parts = [4,3]
    end
    "#{parts[0]}:#{parts[1]}"
  end

  def render
    @background.draw(0,0,@screenWidth/@background.getWidth.to_f)
    @map.render(@scrollX, @screenHeight-@mapHeightPx, @startXTile, @startYTile, @endXTile, @endYTile)
  end

  def canMoveLeft
    @scrollX == 0
  end

  def canMoveRight
    @scrollX < (@mapWidthPx/@screenWidth)
  end

  def moveRight
    if self.canMoveRight
      @scrollX += 1
    else
      false
    end
  end

  def moveLeft
    if self.canMoveLeft
      @scrollX -= 1
    else
      false
    end
  end
end