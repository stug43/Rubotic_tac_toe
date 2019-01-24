# frozen_string_literal: true

require 'pry'
class Game
  attr_accessor :compt_tour, :current_player, :joueur1, :joueur2, :view, :data
  require_relative '../db/data'
  require 'view'

  def initialize
    @data = Datac_toe.new
    @compt_tour = 1
    @view = View.new(self)
    transit_tab = @view.init_players
    @joueur1 = transit_tab[0]
    @joueur2 = transit_tab[1]
  end

  def def_current_player(compt_tour)
    @current_player = if compt_tour.odd?
                        @joueur1
                      else
                        @joueur2
                      end
  end

  def actualize_database(choice)
    if compt_tour.odd?
      @data.hash_pl1[choice.to_sym] = true
    else
      @data.hash_pl2[choice.to_sym] = true
    end
    @data.busy_cells[choice.to_sym] = true
  end

  def is_free?(choice)
    !@data.busy_cells[choice.to_sym]
  end

  def new_tour
    def_current_player(@compt_tour)
    choice = @view.new_tour(@current_player)
    actualize_database(choice)
    @view.display(@data.hash_pl1, @data.hash_pl2)
  end

  def display_array(array_1 = @data.hash_pl1.values, array_2 = @data.hash_pl2.values)
    display_array = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    display_array.map!.with_index do |_k, index|
      if array_1[index] == true
        k = 'pattern_1'
      elsif array_2[index] == true
        k = 'pattern_2'
      end
    end
    display_array
  end

  def has_won?(hash)
    (hash[0] && hash[1] && hash[2]) || (hash[3] && hash[4] && hash[5]) || (hash[6] && hash[7] && hash[8]) || (hash[0] && hash[3] && hash[6]) || (hash[1] && hash[4] && hash[7]) || (hash[2] && hash[5] && hash[8]) || (hash[0] && hash[1] && hash[2]) || (hash[0] && hash[4] && hash[8]) || (hash[2] && hash[4] && hash[6])
  end

  def is_full?(hash)
    !hash.value?(false)
  end

  def perform
    loop do
      new_tour
      if has_won?(@data.hash_pl1.values) || has_won?(@data.hash_pl2.values)
        @view.won(@current_player)
        break
      elsif is_full?(@data.busy_cells)
        @view.is_full
        break
      end
      @compt_tour += 1
    end
  end
end
