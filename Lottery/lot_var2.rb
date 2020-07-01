file_path = "ticket.txt"  ##
f = File.new(file_path)     ## нужно чтоб из текстового файла взять строки
lines = f.readlines       ##



class String
  { :reset          =>  0,
    :bold           =>  1,
    :dark           =>  2,
    :underline      =>  4,
    :blink          =>  5,
    :negative       =>  7,
    :black          => 30,
    :red            => 31,
    :green          => 42,#32
    :yellow         => 43,#33
    :blue           => 44,#34
    :magenta        => 35,
    :cyan           => 36,
    :white          => 47,
  }.each do |key, value|
    define_method key do
      "\e[#{value}m" + self + "\e[0m"
    end
  end
end

puts "\e[H\e[2J"

sleep 0.5
ticket = (1..36).to_a    # массив билета

puts lines[1..11]    # строки из файла
puts




user_choice = []      # масив для чисел пользователя
computer_choice =[]   #массив для чисел компьютера

balls  = 0            # крутим барабан с шарами :)

while balls <= 5
  user_nomber = gets.to_i                           # переменная для чисел пользователя

  if user_nomber <= 0 || user_nomber > 36           # защита от дурака :))
    puts lines[14].red.bold

  elsif user_choice.include? "0"+ "#{user_nomber}"  # защита от повторов
    puts lines[16].red
  elsif user_choice.include? user_nomber            # защита от повторов
    puts lines[16].red

    balls +=0
else
  if user_nomber < 10                               # проверяет если число пользователя меньше 10 то
     user_nomber = "0" + "#{user_nomber}"           # к числам до 10 добавляется 0
     user_choice << user_nomber                     # и в массив попадает число 01 или 02 или 03 и т.д.
  else
  user_choice << user_nomber                        # если больше 10 то сразу добавим их в массив пользователя
  end

  computer_nomber = ticket.sample                   # компьютер выбирает случайное число из массива билета

  if computer_nomber < 10                           # проверяет если число компьютера меньше 10 то
     computer_nomber = "0" + "#{computer_nomber}"   # к числам до 10 добавляется 0
     computer_choice << computer_nomber             # и в массив попадает число 01 или 02 или 03 и т.д.
  else
     computer_choice << computer_nomber             # если больше 10 то сразу добавим их в массив пользователя
  end
  ticket.delete (computer_nomber)                   # удаляем число из массива билета, чтоб не было повторов.
  balls +=1
end
end
puts


# выводит билет с отмечеными числами пользователя
puts lines[5..11].join.sub("#{user_choice[0]}", "#{user_choice[0]}".blue).sub(
                           "#{user_choice[1]}", "#{user_choice[1]}".blue).sub(
                           "#{user_choice[2]}", "#{user_choice[2]}".blue).sub(
                           "#{user_choice[3]}", "#{user_choice[3]}".blue).sub(
                           "#{user_choice[4]}", "#{user_choice[4]}".blue).sub(
                           "#{user_choice[5]}", "#{user_choice[5]}".blue)

puts
puts
sleep 1

puts lines[18].chomp + " " + computer_choice.join(" ").yellow.bold # показывает выбор компьютера

win = user_choice & computer_choice # сравнение массивов насовпадения

puts lines[20].chomp + " " + win.join(" ").green.bold
puts

# выводит билет с отмечеными числами пользователя, компьютера и совпадениями
puts lines [5..10].join("").sub("#{user_choice[0]}", "#{user_choice[0]}".blue).sub(
                                "#{user_choice[1]}", "#{user_choice[1]}".blue).sub(
                                "#{user_choice[2]}", "#{user_choice[2]}".blue).sub(
                                "#{user_choice[3]}", "#{user_choice[3]}".blue).sub(
                                "#{user_choice[4]}", "#{user_choice[4]}".blue).sub(
                                "#{user_choice[5]}", "#{user_choice[5]}".blue).sub(
                                "#{computer_choice[0]}", "#{computer_choice[0]}".yellow).sub(
                                "#{computer_choice[1]}", "#{computer_choice[1]}".yellow).sub(
                                "#{computer_choice[2]}", "#{computer_choice[2]}".yellow).sub(
                                "#{computer_choice[3]}", "#{computer_choice[3]}".yellow).sub(
                                "#{computer_choice[4]}", "#{computer_choice[4]}".yellow).sub(
                                "#{computer_choice[5]}", "#{computer_choice[5]}".yellow).sub(
                                "#{win[0]}", "#{win[0]}".green.blink).sub(
                                "#{win[1]}", "#{win[1]}".green.blink).sub(
                                "#{win[2]}", "#{win[2]}".green.blink).sub(
                                "#{win[3]}", "#{win[3]}".green.blink).sub(
                                "#{win[4]}", "#{win[4]}".green.blink).sub(
                                "#{win[5]}", "#{win[5]}".green.blink)

puts
if win.size == 0
  puts lines[22].bold.red.chomp
  elsif win.size == 1
    puts lines[23].bold.red.chomp
  elsif win.size ==2
    puts lines[24].bold.green.chomp
  elsif win.size == 3
    puts lines[25].bold.green.chomp
  elsif win.size == 4
    puts lines[26].bold.green.chomp
  elsif win.size == 5
    puts lines[27].bold.green.chomp
  elsif win.size == 6
    puts lines[28].bold.green.chomp
end
puts
puts lines[21..29]
