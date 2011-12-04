require './life'

w = World.new
c1 = Cell.new [0, 0]
c2 = Cell.new [0, -1]
c3 = Cell.new [-1, 0]
c4 = Cell.new [-1, -1]
c5 = Cell.new [-2, -1]
c6 = Cell.new [ 1, 0]

w.add_cell( c1 )
w.add_cell( c2 )
w.add_cell( c3 )
w.add_cell( c4 )
w.add_cell( c5 )
w.add_cell( c6 )

while true do

  (-4..4).each do |x|
    (-4..4).each do |y|
      if w.has_a_cell_with_coordinates?( [x,y] )
        print '*'
      else
        print '.'
      end
    end
    puts ""
  end

  w = w.tick
  sleep 1
end

