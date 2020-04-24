require_relative "../lib/tic_tac_toe.rb"

system('clear')

puts "\e[35m
___________________________________
___________________________________

       JOUONS AU TIC-TAC-TOE ! 

#      ╦ ╦╔═╗╦ ╦  ╦ ╦╔═╗╔╗╔╦╗
#      ╚╦╝║ ║║ ║  ║║║╠═╣║║║║ 
#       ╩ ╚═╝╚═╝  ╚╩╝╩ ╩╝╚╝╩ 
#      ╔╦╗╔═╗  ╔═╗╦  ╔═╗╦ ╦  
#       ║ ║ ║  ╠═╝║  ╠═╣╚╦╝  
#       ╩ ╚═╝  ╩  ╩═╝╩ ╩ ╩   
#      ╔═╗  ╔═╗╔═╗╔╦╗╔═╗┌─┐  
#      ╠═╣  ║ ╦╠═╣║║║║╣  ┌┘  
#      ╩ ╩  ╚═╝╩ ╩╩ ╩╚═╝ o       
___________________________________
__________________________________\e[0m"


sleep(3)
system('clear')
puts "
Joueur N°1, Dis nous quel est ton nom:"
nom_1 = gets
joueur_1 = TicTacToe::Player.new({color: " X ", name: nom_1.chomp})

#sleep(1)
puts "
Joueur N°2, Dis nous quel est ton nom:"
nom_2 = gets
joueur_2 = TicTacToe::Player.new({color: " O ", name:nom_2.chomp})

sleep(3)
system('clear')


puts "
#{nom_1.chomp} tu vas jouer avec les X et #{nom_2.chomp} avec les O"




sleep(3)
system('clear')

#sleep(1)
players = [joueur_1, joueur_2]
TicTacToe::Game.new(players).play