puts %(Игра "Камень, ножницы, бумага")
puts "Играют два игрока.
Имя первого игрока: "

gamer1 = gets.chomp
gamer1_win = 0

puts "Имя второго игрока: "
gamer2 = gets.chomp
gamer2_win = 0

puts "Сколько раз хотите сыграть?"
x_times = gets.to_i

draw = 0 #ничья

choice = %w[камень ножницы бумага] #выбор

x_times.times {
puts
gamer1_choice = choice.sample
gamer2_choice = choice.sample

puts gamer1 + " " + gamer1_choice
puts gamer2 + " " + gamer2_choice


#ничья
if gamer1_choice == "камень"  && gamer2_choice == "камень" ||
   gamer1_choice == "ножницы" && gamer2_choice == "ножницы" ||
   gamer1_choice == "бумага"  && gamer2_choice == "бумага"
   draw +=1
   puts "НИЧЬЯ!"
end

#Победа ирок 1
if gamer1_choice == "камень"  && gamer2_choice == "ножницы" ||
   gamer1_choice == "ножницы" && gamer2_choice == "бумага" ||
   gamer1_choice == "бумага"  && gamer2_choice == "камень"
   puts "#{gamer1} П О Б Е Д А !!!"
   gamer1_win += 1
end

#Победа игрок 2
if gamer1_choice == "ножницы" && gamer2_choice == "камень" ||
   gamer1_choice == "бумага"  && gamer2_choice == "ножницы" ||
   gamer1_choice == "камень"  && gamer2_choice == "бумага"
   puts "#{gamer2} П О Б Е Д А !!!"
   gamer2_win += 1
end
sleep 0.5
}

puts
puts "Ничья "  + draw.to_s
puts gamer1 + " " + gamer1_win.to_s
puts gamer2 + " " + gamer2_win.to_s

