class World

  attr :cells, true
  def add_cell( cell )
    @cells ||= []
    @cells << cell
  end

  def survives?( cell )
    if [0,1].include? neighbour_count( cell )
      false
    elsif [2,3].include? neighbour_count( cell )
      true
    else
      false
    end
  end

  def neighbour_count( cell )
    count = 0
    (-1..1).each do |x|
      (-1..1).each do |y|
        #count += 1 if cells.any?{ |c| (c.coordinates[0] == cell.coordinates[0] + x) && (c.coordinates[1] == cell.coordinates[1] + y) }
        count += 1 if has_a_cell_with_coordinates?([ cell.coordinates[0] + x, cell.coordinates[1] + y ])
      end
    end
    count = count - 1 if has_a_cell_with_coordinates?( cell.coordinates ) # because we've counted the cell itself in the above calculation
    count

  end


  def resurrect_these( cell )
    return_cells = []

    (-1..1).each do |x|
      (-1..1).each do |y|
        c = Cell.new [ x + cell.coordinates[0], y + cell.coordinates[1] ]
        return_cells << c if neighbour_count( c )  == 3
      end
    end

    return_cells.reject{ |c| c.coordinates == cell.coordinates }
  end

  def has_a_cell_with_coordinates?( coordinates )
    cells.map(&:coordinates).include? coordinates unless cells.nil?
  end

  def tick
    next_world = World.new
    self.cells.each do |cell|
      next_world.add_cell( cell ) if survives?( cell )
      resurrect_these( cell ).each {|c| next_world.add_cell( c ) unless next_world.has_a_cell_with_coordinates?(c.coordinates) }
    end
    return next_world
  end

end

class Cell

  attr :coordinates, true

  def initialize( coordinates )
    @coordinates = coordinates
  end

  def to_s
    "#{coordinates[0]}, #{coordinates[1]}"
  end

end


