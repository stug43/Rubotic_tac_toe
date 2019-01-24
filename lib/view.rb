# frozen_string_literal: true

require 'pry'
require 'colorize'
class View
  attr_accessor :game
  require 'game'

  def initialize(game = "si tu aimes les mangas regardes Jojo's bizare adventure") # BEST ANIME EVER
    @game = game
  end

  def init_players
    joueur2 = 'joueur 2'
    puts('Joueur 1, quel est ton nom ?')
    print("\t>>")
    joueur1 = gets.chomp
    puts('Joueur 2, quel est ton nom ?')
    print("\t>>")
    joueur2 = gets.chomp
    joueur1 = 'joueur 1' if joueur1 == ''
    joueur2 = 'joueur 2' if joueur2 == ''
    [joueur1, joueur2]
  end

  def index
    choice = 0
    while choice != 1 && choice != 2 && choice != 3
      puts("\t1 > Commencer une partie\n\t2 > Rappel des règles\n\t3 > quitter\n\n")
      print("\t\t>>")
      choice = gets.chomp.to_i
    end
    choice
  end

  def rules
    puts("Le Morpion, également appelé Tic-Tac-Toe se joue sur une grille carrée de 3x3 cases. Deux joueurs s'affrontent. Ils doivent remplir chacun à leur tour une case de la grille avec le symbole qui leur est attribué. Le gagnant est celui qui arrive à aligner trois symboles identiques, horizontalement, verticalement ou en diagonale.")
  end

  def new_tour(current_player)
    puts("TOUR #{@game.compt_tour}")
    puts("C'est à #{current_player} de jouer")
    choice = "le prochain qui dit 'au temps pour moi' je lui offre une partouze de gifles"
    while (choice != 'a1') && (choice != 'a2') && (choice != 'a3') && (choice != 'b1') && (choice != 'b2') && (choice != 'b3') && (choice != 'c1') && (choice != 'c2') && (choice != 'c3')
      print("\t\t>>")
      choice = gets.chomp.downcase
    end
    while !@game.is_free?(choice) || ((choice != 'a1') && (choice != 'a2') && (choice != 'a3') && (choice != 'b1') && (choice != 'b2') && (choice != 'b3') && (choice != 'c1') && (choice != 'c2') && (choice != 'c3'))
      print("\t\t>>")
      choice = gets.chomp.downcase
    end
    choice
  end

  def display(_hash_pl1, _hash_pl2)
    pattern_pl1 = [' # '.green, '###'.green, ' # '.green]
    pattern_pl2 = ['@ @'.red, ' @ '.red, '@ @'.red]
    default = ['   ', '   ', '   ']
    useless_counter = 0
    display_array = @game.display_array()
    puts('   1   2   3 ')
    while useless_counter < 3
      current_row = [default, default, default]
      (display_array[useless_counter * 3].nil? ? nil : (display_array[useless_counter * 3] == 'pattern_1' ? current_row[0] = pattern_pl1 : current_row[0] = pattern_pl2))
      (display_array[useless_counter * 3 + 1].nil? ? nil : (display_array[useless_counter * 3 + 1] == 'pattern_1' ? current_row[1] = pattern_pl1 : current_row[1] = pattern_pl2))
      (display_array[useless_counter * 3 + 2].nil? ? nil : (display_array[useless_counter * 3 + 2] == 'pattern_1' ? current_row[2] = pattern_pl1 : current_row[2] = pattern_pl2))
      if useless_counter == 0
        row1 = '  ' + current_row[0][0] + '|'.yellow + current_row[1][0] + '|'.yellow + current_row[2][0]
        row2 = 'A ' + current_row[0][1] + '|'.yellow + current_row[1][1] + '|'.yellow + current_row[2][1]
        row3 = '  ' + current_row[0][2] + '|'.yellow + current_row[1][2] + '|'.yellow + current_row[2][2]
        puts(row1)
        puts(row2)
        puts(row3)
        puts('  ' + '='.yellow * 11)
      elsif useless_counter == 1
        row4 = '  ' + current_row[0][0] + '|'.yellow + current_row[1][0] + '|'.yellow + current_row[2][0]
        row5 = 'B ' + current_row[0][1] + '|'.yellow + current_row[1][1] + '|'.yellow + current_row[2][1]
        row6 = '  ' + current_row[0][2] + '|'.yellow + current_row[1][2] + '|'.yellow + current_row[2][2]
        puts(row4)
        puts(row5)
        puts(row6)
        puts('  ' + '='.yellow * 11)
      elsif useless_counter == 2
        row7 = '  ' + current_row[0][0] + '|'.yellow + current_row[1][0] + '|'.yellow + current_row[2][0]
        row8 = 'C ' + current_row[0][1] + '|'.yellow + current_row[1][1] + '|'.yellow + current_row[2][1]
        row9 = '  ' + current_row[0][2] + '|'.yellow + current_row[1][2] + '|'.yellow + current_row[2][2]
        puts(row7)
        puts(row8)
        puts(row9)
        puts
      end
      useless_counter += 1
    end
  end

  def won(player)
    puts("\n\n\t\t#{player} gagne !\n\n".upcase + "Cette partie est maintenant terminée.\n\n")
  end

  def is_full
    puts("\n\n\t\tGAME OVER\n\t\tmatch nul x)\n")
  end
end
