# Maze.rb
# Procedural edition

WALL = '#'
DIRS = [
  { wall_x:  0, wall_y: -1, cell_x:  0, cell_y: -2 },
  { wall_x:  0, wall_y:  1, cell_x:  0, cell_y:  2 },
  { wall_x:  1, wall_y:  0, cell_x:  2, cell_y:  0 },
  { wall_x: -1, wall_y:  0, cell_x: -2, cell_y:  0 }
]

# Both width and height should be odd
@height = 15
@width = 31
@maze = []
@height.times { @maze << ( [WALL] * @width) }

def visit(y, x, dir = { cell_y: 0, cell_x: 0 })
  y, x = get_cell_loc(y, x, dir)

  @maze[y][x] = ' '

  DIRS.shuffle.each do |dir|
    if get_neighbor(y, x, dir) == WALL
      remove_wall(y, x, dir)
      visit(y, x, dir)
    end
  end
end

def get_neighbor(y, x, dir)
  y, x = get_cell_loc(y, x, dir)

  return nil unless in_maze(y, x)
  @maze[y][x]
end

def remove_wall(y, x, dir)
  wall_y, wall_x = get_wall_loc(y, x, dir)

  return unless in_maze(wall_y, wall_x)
  @maze[wall_y][wall_x] = ' '
end

def get_cell_loc(y, x, dir)
  [y + dir[:cell_y], x + dir[:cell_x]]
end

def get_wall_loc(y, x, dir)
  [y + dir[:wall_y], x + dir[:wall_x]]
end

def in_maze(y, x)
  y.between?(0, @height - 1) && x.between?(0, @width - 1)
end

def print_maze
  @maze.each do |row|
    puts row.join
  end
end

visit(1, 1)
print_maze
