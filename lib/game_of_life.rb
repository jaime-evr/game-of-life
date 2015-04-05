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
  def initialize(height, width)
    @grid = Array.new(height) { Array.new(width) { [true, false].sample } }

    #Glider
    #@grid[20][5] = true
    #@grid[21][5] = true
    #@grid[22][5] = true
    #@grid[22][4] = true
    #@grid[21][3] = true

    #Pulsar
    #@grid[10][30] = true
    #@grid[10][31] = true
    #@grid[10][32] = true

    #@grid[10][36] = true
    #@grid[10][37] = true
    #@grid[10][38] = true

    #@grid[12][28] = true
    #@grid[13][28] = true
    #@grid[14][28] = true

    #@grid[12][33] = true
    #@grid[13][33] = true
    #@grid[14][33] = true

    #@grid[12][35] = true
    #@grid[13][35] = true
    #@grid[14][35] = true

    #@grid[12][40] = true
    #@grid[13][40] = true
    #@grid[14][40] = true

    #@grid[15][30] = true
    #@grid[15][31] = true
    #@grid[15][32] = true

    #@grid[15][36] = true
    #@grid[15][37] = true
    #@grid[15][38] = true

    #@grid[17][30] = true
    #@grid[17][31] = true
    #@grid[17][32] = true

    #@grid[17][36] = true
    #@grid[17][37] = true
    #@grid[17][38] = true

    #@grid[18][28] = true
    #@grid[19][28] = true
    #@grid[20][28] = true

    #@grid[18][33] = true
    #@grid[19][33] = true
    #@grid[20][33] = true

    #@grid[18][35] = true
    #@grid[19][35] = true
    #@grid[20][35] = true

    #@grid[18][40] = true
    #@grid[19][40] = true
    #@grid[20][40] = true

    #@grid[22][30] = true
    #@grid[22][31] = true
    #@grid[22][32] = true

    #@grid[22][36] = true
    #@grid[22][37] = true
    #@grid[22][38] = true
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
        if cell
          print_cells_row += ' 0 '
        else
          print_cells_row += '   '
        end
      end
      puts print_cells_row + '|'
    end
    puts '----------------------------------------------'
    puts 'exit with `ctrl + c`'
    puts '----------------------------------------------'
  end
end

game = GameOfLife.new(60, 70)
game.start!

