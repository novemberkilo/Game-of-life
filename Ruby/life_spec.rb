require './life'

describe World do

  it "should have cells" do
    w = World.new
    c = Cell.new [0, 0]

    w.add_cell c
    w.cells.should_not be_empty
  end

  it "should know if a cell survives - 1" do
    w = World.new
    c1 = Cell.new [0, 0]
    c2 = Cell.new [-1, 0]
    c3 = Cell.new [0, 1]
    c4 = Cell.new [1, 1]
    c5 = Cell.new [1, -1]

    w.add_cell c1
    w.add_cell c2
    w.add_cell c3
    w.add_cell c4
    w.add_cell c5

    w.survives?( c1 ).should be_false
    w.survives?( c2 ).should be_true
  end

  it "should know if a cell survives - 2 " do
    w = World.new
    c1 = Cell.new [0, 0]
    c2 = Cell.new [0, 1]
    c3 = Cell.new [1, 1]
    c4 = Cell.new [1, 0]
    c5 = Cell.new [-1, -1]

    w.add_cell c1
    w.add_cell c2
    w.add_cell c3
    w.add_cell c4
    w.add_cell c5


    w.survives?( c1 ).should be_false
    w.survives?( c2 ).should be_true
    w.survives?( c3 ).should be_true
    w.survives?( c4 ).should be_true
    w.survives?( c5 ).should be_false

  end

  it "should know if it has a cell with given coordinates" do

    w = World.new
    c1 = Cell.new [0, 0]

    w.add_cell c1

    w.has_a_cell_with_coordinates?([0,0]).should be_true
    w.has_a_cell_with_coordinates?([-2,1]).should be_false

  end

  it "should know if a cell survives" do
    w = World.new
    c = Cell.new [0, 0]

    w.add_cell c
    w.survives?( c ).should be_false
  end

  it "should know the neighbour count for a cell" do

    w = World.new
    c1 = Cell.new [0, 0]
    c2 = Cell.new [-1, 0]
    c3 = Cell.new [0, 1]
    c4 = Cell.new [1, 1]
    c5 = Cell.new [4, 4]

    w.add_cell c1
    w.add_cell c2
    w.add_cell c3
    w.add_cell c4
    w.add_cell c5

    w.neighbour_count( c1 ).should == 3
    w.neighbour_count( c5 ).should == 0
    w.neighbour_count( c2 ).should == 2
  end

  it "should know the neighbours of a cell that come to life" do
    w = World.new
    c1 = Cell.new [0, 0]
    c2 = Cell.new [0, -1]
    c3 = Cell.new [0, 1]

    c4 = Cell.new [-1, 0]
    c5 = Cell.new [1, 0]

    w.add_cell c1
    w.add_cell c2
    w.add_cell c3

    c6, c7 = w.resurrect_these( c1 )
    c6.coordinates.should == [-1, 0]
    c7.coordinates.should == [1, 0]

  end


end

describe Cell do

  it "should have coordinates" do
    c = Cell.new( [0,0] )
    c.coordinates.should == [0, 0]
  end


end
