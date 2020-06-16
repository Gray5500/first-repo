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

vibor = %w[камень ножницы бумага]

x_times.times {
puts
gamer1_vibor = vibor.sample
gamer2_vibor = vibor.sample

puts gamer1 + " " + gamer1_vibor
puts gamer2 + " " + gamer2_vibor


#ничья
if gamer1_vibor == "камень"  && gamer2_vibor == "камень" ||
   gamer1_vibor == "ножницы" && gamer2_vibor == "ножницы" ||
   gamer1_vibor == "бумага"  && gamer2_vibor == "бумага"
   draw +=1
   puts "НИЧЬЯ!"
end

#Победа ирок 1
if gamer1_vibor == "камень"  && gamer2_vibor == "ножницы" ||
   gamer1_vibor == "ножницы" && gamer2_vibor == "бумага" ||
   gamer1_vibor == "бумага"  && gamer2_vibor == "камень"
   puts "#{gamer1} П О Б Е Д А !!!"
   gamer1_win += 1
end

#Победа игрок 2
if gamer1_vibor == "ножницы" && gamer2_vibor == "камень" ||
   gamer1_vibor == "бумага"  && gamer2_vibor == "ножницы" ||
   gamer1_vibor == "камень"  && gamer2_vibor == "бумага"
   puts "#{gamer2} П О Б Е Д А !!!"
   gamer2_win += 1
end
sleep 0.5
}

puts
puts "Ничья "  + draw.to_s
puts gamer1 + " " + gamer1_win.to_s
puts gamer2 + " " + gamer2_win.to_s
