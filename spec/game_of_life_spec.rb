require 'spec_helper'

describe GameOfLife do
  describe '#living?' do
    let(:game) { GameOfLife.new(10, 10) }

    it 'returns true if cell is alive' do
      puts '*' * 10
      puts game.living? true, 1, 2
      puts '*' * 10
    end
  end
end
