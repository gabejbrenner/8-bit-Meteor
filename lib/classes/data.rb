require "json"
require "lib/classes/map.rb"
require "lib/Slick.rb"
require "json"

class DataHandler
  attr_accessor :maps, :pops, :currentMapId, :map

  def initialize(path, container)
    @currentMapId = 0
    @maps = []
    @pops = []
    @container = container
    @path = path
    self.fetchMaps
    @map = self.getMap(0)
  end

  def fetchMaps
    mapPath = "#{@path}map/"
    fullMapListing = Dir.entries(mapPath)
    fullMapListing.each do |item|
      item = "#{mapPath}#{item}"
      #           tests if file isn't '.' or '..'                 tests if file isn't a backup             tests if file is a map       tests if file exists
      #(                                                 )   (                                      )   (                            )    (                )
      if item != "#{mapPath}." and item != "#{mapPath}.." and /.+~/.match(File.extname(item)) == nil and File.extname(item) == ".tmx" and File.exist?(item)
        @maps << item
      else
        puts "#{item} IS NOT A LEVEL!"
        if File.extname(item) == ".pop"
          puts "#{item} is a population file, put it in dat/pop/"
        elsif File.extname(item) == ".png" or File.extname(item) == ".jpg"
          puts "#{item} is an image file, put it in the appropriate sub-directory of dat/img/"
        end
      end
    end
  end

  def getMap(index)
    @map = Map.new(@maps[@currentMapId = index], @container)
  end

  def nextMap()
    @map = Map.new(@maps[@currentMapId += 1], @container)
  end

  def prevMap()
    @map = Map.new(@maps[@currentMapId -= 1], @container)
  end

end