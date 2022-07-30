LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

col_seperator, row_seperator = ' | ', '--+---+----'
board = [[1,2,3], [4,5,6], [7,8,9]]
puts board.map { |row| row.join(col_seperator) }.join("\n" + row_seperator + "\n")


isGameOver = false
play_count = 0
played_board = board
player = 1
positions_1 = []
positions_2 = []
while !isGameOver && play_count < 9 do
    if player == 1
        begin
        puts 'Player 1 Please Enter The Number To Mark'
        choice_1 = gets.chomp.to_i
        end while (positions_1+positions_2).include?(choice_1)
        positions_1 << choice_1
        p positions_1
        played_board = played_board.map do |row| 
            row.map {|cell| cell == choice_1&&cell != 'X'&&cell != 'O' ? 'X' : cell}
        end
        puts played_board.map { |row| row.join(col_seperator) }.join("\n" + row_seperator + "\n")
        play_count += 1
        player += 1
        if (LINES.any? do |line|
            line.all? {|position| positions_1.include?(position)}
            end)
            puts 'Player1 won'
            isGameOver = true
        end
    elsif player == 2
        begin
        puts 'Player 2 Please Enter The Number To Mark'
        choice_2 = gets.chomp.to_i
        end while (positions_1+positions_2).include?(choice_2)
        positions_2 << choice_2
        p positions_2
        played_board = played_board.map do |row| 
            row.map {|cell| cell == choice_2&&cell != 'X'&&cell != 'O' ? 'O' : cell}
        end
        puts played_board.map { |row| row.join(col_seperator) }.join("\n" + row_seperator + "\n")
        play_count += 1
        player -= 1 
        if (LINES.any? do |line|
            line.all? {|position| positions_2.include?(position)}
            end)
            puts 'Player2 won'
            isGameOver = true
        end
    end
    
end


class Player1
    
end

class Player2

end