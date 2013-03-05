require "json"
require "lib/classes/map.rb"

class DataHandler
  attr_accessor :maps, :manifests
  
  def initialize(path)
    @maps = []
    @pops = []
    @backgrounds = []
    @path = path
    self.fetchResources()
  end
  
  def fetchResources()
    self.fetchMaps()
    self.fetchPops()
    self.fetchBackgrounds()
  end
  
  def fetchMaps()
    mapPath = "#{@path}map/"
    fullMapListing = Dir.entries(mapPath)
    fullMapListing.each do |item|
      item = "#{mapPath}#{item}"
      #           tests if file isn't '.' or '..'                 tests if file isn't a backup             tests if file is a map       tests if file exists
      #(                                                 )   (                                      )   (                            )    (                )
      if item != "#{mapPath}." and item != "#{mapPath}.." and /.+~/.match(File.extname(item)) == nil and File.extname(item) == ".tmx" and File.exist?(item)
        @maps << item = TiledMap.new(item)
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
  
  def fetchPops()
    popPath = "#{@path}dat/pop/"
    fullPopListing = Dir.each do |item|
      item = "#{popPath}#{item}"
      #       tests if file isn't '.' or '..'                     tests if file isn't a backup            tests if file is a pop file    tests if file exists
      #(                                                 )    (                                     )   (                            )   (                 )
      if item != "#{popPath}." and item != "#{popPath}.." and /.+~/.match(File.extname(item)) == nil and File.extname(item) == ".pop" and File.exist?(item)
        @pops << item
      else
        puts "#{item} IS NOT A POP!"
        if File.extname(item) == ".tmx"
          puts "#{item} is a map, put it in dat/map/"
        elsif File.extname(item) == ".png" or File.extname(item) == ".jpg"
          puts "#{item} is and image file, put it in the appropriate sub-directory of dat/img/"
        end
      end
    end
  end
  
  def fetchBackgrounds()
    backgroundPath = "#{@path}img/backgrounds/"
    fullBackgroundListing = Dir.entries(backgroundPath)
    fullBackgroundListing.each do |item|
      item = "#{backgroundPath}#{item}"
      #        tests to make sure file isn't '.' or '..'                           tests to make sure file is an image file                   tests if file exists
      # (                                                              )    (                                                            )    (                 )
       if item != "#{backgroundPath}." and item != "#{backgroundPath}.." and File.extname(item) == ".png" or File.extname(item) == ".jpg" and File.exist?(item)
        @backgrounds << item
      else
        puts "#{item} IS NOT A BACKGROUND!"
        if File.extname(item) == ".tmx"
          puts "#{item} is a map file, put it in dat/map/"
        elsif File.extname(item) == ".pop"
          puts "#{item} is a population file, put it in dat/pop/"
        end
      end
    end
  end
end