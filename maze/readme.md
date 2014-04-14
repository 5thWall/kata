# Recursive Maze Generation

I think recursive maze generation is one of my favorite "new language"
exercises. It's easy enough to make procedurally, but there's room for
object oriented principles. Being recursive, it can also lend itself to
purely functional solutions.

## The algorithm

1. Start at a random cell.
2. Mark the current cell as visited.
3. Get a list of neighboring cells.
4. Starting with a random neighbor, knock down the wall between cells if the
   neighbor has _not_ been visited yet.
5. Recurse using the neighbor as the current cell.

You can find more information about this kata at [Rosetta Code][rc].

[rc]: http://rosettacode.org/wiki/Maze_generation
