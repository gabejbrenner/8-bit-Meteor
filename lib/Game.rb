class Game < BasicGame
  def init(container)
    @container = container
    @x, @y = 100, 100
    system('ls ../')
    @meteor = Image.new('dat/img/meteor1.png')
  end
  
  def render(container, graphics)
    @meteor.draw(@x,@y)
  end
  
  def update(container, delta)
    @x += 1
    @y += 1
  end
end