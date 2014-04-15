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

start_y = Random.rand(1...@height)
start_x = Random.rand(1...@width)

def visit(y, x)
  @maze[y][x] = ' '

  DIRS.shuffle.each do |dir|
    if get_neighbor(y, x, dir) == WALL
      remove_wall(y, x, dir)
      visit(y, x)
    end
  end
end

def get_neighbor(y, x, dir)
  new_y = y + dir[:cell_y]
  new_x = x + dir[:cell_x]

  return nil unless in_maze(new_y, new_x)
  @maze[new_y][new_x]
end

def remove_wall(y, x, dir)
  wall_y = y + dir[:wall_y]
  wall_x = x + dir[:wall_x]

  return unless in_maze(wall_y, wall_x)
  @maze[wall_y][wall_x] = ' '
end

def in_maze(y, x)
  y.between?(0, @height - 1) && x.between?(0, @width - 1)
end

def print_maze
  @maze.each do |row|
    puts row.join
  end
end

visit(start_y, start_x)
print_maze
