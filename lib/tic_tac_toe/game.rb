module TicTacToe
  class Game
    attr_reader :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
  		@current_player, @other_player = @other_player, @current_player
		end

		def solicit_move
  		"#{current_player.name}: Enter a number between 1 and 9 to make your move"
		end

		def get_move(human_move = gets.chomp)

			while not ["1", "2", "3", "4", "5", "6", "7", "8", "9"].include?(human_move)
        sleep(3)
				system('clear')        
        puts "___________________________________\e[5m
            ┬┌─┐┬┌─┐
            │ ┌┘│ ┌┘
            o o o o 
     ▄██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█▄
    ███─────────────────────██
   ███───────────────────────██
  ███────▄▀▀▀▀▄─────▄▀▀▀▀▄────██
 ████──▄▀──────▀▄─▄▀──────▀▄──███
 ████───▄██████─────██████▄───███
█████──██▓▓▓▓▓██───██▓▓▓▓▓██──█████
█████──██▓▓█▓▓██───██▓▓█▓▓██──█████
█████──██▓▓▓▓▓█▀─▄─▀█▓▓▓▓▓██──█████
████▀──▀▀▀▀▀▀▀▀─▄█▄─▀▀▀▀▀▀▀▀──▀████
███─▄▀▀▀▄──────█████──────▄▀▀▀▄─███
███──▄▀▄─█────███████────█─▄▀▄──███
███─█──█─█────███████────█─█──█─███
███─█─▀──█───▄███████▄───█──▀─█─███
███▄─▀▀▀▀────█─▀███▀─█────▀▀▀▀─▄███
████───────────────────────────████
 ███─────▀████████████████▀─────██
 ███─────────█───────█────────███
   ████─────█─────────█──────████
     ███▄──█────███────█───▄███
       ▀█████▄▄█████▄▄███████▀
              █     █
     ╔═╗╔╦╗╔╦╗╔═╗╔╗╔╦╗╦╔═╗╔╗╔
     ╠═╣ ║  ║ ║╣ ║║║║ ║║ ║║║║
     ╩ ╩ ╩  ╩ ╚═╝╝╚╝╩ ╩╚═╝╝╚╝   
            ┬┌─┐┬┌─┐
            │ ┌┘│ ┌┘
            o o o o 
      **********************
   !!!! ON A DIT DE 1 à 9 !!!!
      **********************\e[25m
___________________________________\e[0m"

        human_move = gets.chomp
        end
  		human_move_to_coordinate(human_move)
		end





		def game_over_message
      sleep(3)
			system('clear')
      return "\e[32m\e[5m______________
╔╗ ╦═╗╔═╗╦  ╦╔═╗
╠╩╗╠╦╝╠═╣╚╗╔╝║ ║
╚═╝╩╚═╩ ╩ ╚╝ ╚═╝
*****************
#{current_player.name} !
*****************
╔╦╗╦ ╦  ╔═╗╔═╗ 
 ║ ║ ║  ╠═╣╚═╗ 
 ╩ ╚═╝  ╩ ╩╚═╝ 
╔═╗╔═╗╔═╗╔╗╔╔═╗
║ ╦╠═╣║ ╦║║║║╣ 
╚═╝╩ ╩╚═╝╝╚╝╚═╝
______________\e[0m" if board.game_over == :winner
      					sleep(3)
								system('clear')
      return "\e[34m\e[5m_________________________________________________
                                                  
                     'cxOOxc'                     
                  ':d0NWWWWNKxc'                  
                ;oONWWWWWWWWWWN0d:'               
             ;oOXWWWNOdddoodkXWWWN0d:             
          ;lkXWWWWNOookK0kdollxXWWWWXOo;          
       ,lkXWWWWWWNxckNWWXOkdxd:lKWWWWWWXOo;       
    ,ckKWWWWWWWWNdc0WWWWXOxdddo;:KWWWWWWWWXkl,    
 'cxKNWWWWWWWWWNd:kXK0OOxdlcllol;cKWWWWWWWWWWKkc, 
'dNWWWWWWWWWWWWk,,;;clcccccccc;'''lXWWWWWWWWWWWWk,
 cXWWWWWWWWWWWXl   'xNWWKkKNW0;   ,OWWWWWWWWWWWNo 
  dNWWWWWWWWWWWKl'  ;OWWNXXWXl   ;kNWWWWWWWWWWWk' 
  ,OWWWWWWWWWN0d:    ,ldxkxo:    ,oOXWWWWWWWWW0;  
   cXWWWWWWWKl'''''''''''''''''''''';kNWWWWWWNl   
    dNWWWWWK: ,kKKKK0KKK00K00K0KKK0c 'kWWWWWWx'   
    ,OWWWWXl  ;0WWWWWWWWWWWWWNWWWWNl  ;OWWWW0;    
     cKWWNd'  ,OWWWWKkkO0X0kOkONWWXl   cKWWXl     
      dNWXc   ,OWWWWNkOkx0xldO0NWWXc   'kWWx'     
      ,OWNx,  'kWWWWNXXXXWNKKWWWWWK:   lXM0;      
       ;dxdc' 'xXXXXXXXXXXXXXXXXXX0;  ;oxd:       
        :kOO0d,:ooooooooooooooooooc,cOOOOc        
        ,kWWWXdodddddddddddddddddxdo0WWW0;        
         ;dxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:         
              ╔═╗╔═╗╔═╗╦  ╦╔╦╗╔═╗   
              ║╣ ║ ╦╠═╣║  ║ ║ ║╣    
              ╚═╝╚═╝╩ ╩╩═╝╩ ╩ ╚═╝   
             ╔═╗╔═╗╦═╗╔═╗╔═╗╔╗╔╗╔╔═╗
             ╠═╝║╣ ╠╦╝╚═╗║ ║║║║║║║╣ 
             ╩  ╚═╝╩╚═╚═╝╚═╝╝╚╝╚╝╚═╝
             ╔╗╔╔═╗  ╔═╗╔═╗╔═╗╔╗╔╔═╗
             ║║║║╣   ║ ╦╠═╣║ ╦║║║║╣ 
             ╝╚╝╚═╝  ╚═╝╩ ╩╚═╝╝╚╝╚═╝
_________________________________________________\e[0m" if board.game_over == :draw
    end





    # On indique qui commence à jouer
    def play
      puts "________________________
╔═╗╗╔═╗╔═╗╔╦╗
║   ║╣ ╚═╗ ║ 
╚═╝ ╚═╝╚═╝ ╩ 
**********************
\e[32m\e[5m#{current_player.name}!!\e[0m
**********************
╔═╗ ╦ ╦ ╦
║ ║ ║ ║ ║
╚═╬ ╚═╝ ╩ 
╔═╗╔═╗╔╦╗╔╦╗╔═╗╔╗╔╔═╗╔═╗
║  ║ ║║║║║║║║╣ ║║║║  ║╣ 
╚═╝╚═╝╩ ╩╩ ╩╚═╝╝╚╝╚═╝╚═╝
________________________"
      sleep(1)

      # On lance la grille vide et l'invitation au jeu, ou le message de fin de partie, ou en change le joueur en cours
      while true
        board.formatted_grid
        puts ""
        puts solicit_move
        x, y = get_move
        board.set_cell(x, y, current_player.color)
        if board.game_over
          board.formatted_grid
          puts game_over_message
          return
        else
          switch_players
        end
      end
    end




		private
		def human_move_to_coordinate(human_move)
  		mapping = {
    		"1" => [0, 0],
    		"2" => [1, 0],
    		"3" => [2, 0],
    		"4" => [0, 1],
    		"5" => [1, 1],
    		"6" => [2, 1],
    		"7" => [0, 2],
    		"8" => [1, 2],
    		"9" => [2, 2]
 		 }
  		mapping[human_move]
		end



  end
end
