# Conway's Game of Life
#
# 1.- Any live cell with fewer than two live neighbours dies, as if caused by
#     under-population.
#
# 2.- Any live cell with two or three live neighbours lives on to the next
#     generation.
#
# 3.- Any live cell with more than three live neighbours dies, as if by
#     overcrowding.
#
# 4.- Any dead cell with exactly three live neighbours becomes a live cell,
#     as if by reproduction.
#

require 'pry'

class GameOfLife
  def initialize(height, width, life_probability)
    @grid = Array.new(height) { Array.new(width) { life_probability > rand } }
  end

  def living?(cell, y, x)
    total = count_alive_neighbours(y, x)
    cell ? (2..3) === total : total == 3
  end

  def count_alive_neighbours(y, x)
    count = 0
    count += 1 if @grid_state[y-1] && @grid_state[y-1][x-1]
    count += 1 if @grid_state[y-1] && @grid_state[y-1][x]
    count += 1 if @grid_state[y-1] && @grid_state[y-1][x+1]
    count += 1 if @grid_state[y]   && @grid_state[y][x-1]
    count += 1 if @grid_state[y]   && @grid_state[y][x+1]
    count += 1 if @grid_state[y+1] && @grid_state[y+1][x-1]
    count += 1 if @grid_state[y+1] && @grid_state[y+1][x]
    count += 1 if @grid_state[y+1] && @grid_state[y+1][x+1]
    count
  end

  def start!
    loop do
      @grid_state = Marshal.load(Marshal.dump(@grid))
      print_state
      @grid_state.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          @grid[y][x] = living?(cell, y, x)
        end
      end
      sleep(0.1)
    end
  end

  def print_state
    @grid_state.each do |row|
      print_cells_row = '|'
      row.each_with_index do |cell|
        print_cells_row += cell ? ' 0 ' : '   '
      end
      puts print_cells_row + '|'
    end
    puts '----------------------------------------------'
    puts 'exit with `ctrl + c`'
    puts '----------------------------------------------'
  end
end

game = GameOfLife.new(54, 86, 0.1)
game.start!

