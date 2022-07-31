module TicTacToe
    $LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    $board = [[1,2,3], [4,5,6], [7,8,9]]
    class Game
        def print_board
            @@col_seperator, @@row_seperator = ' | ', '--+---+----'
            puts $board.map { |row| row.join(@@col_seperator) }.join("\n" + @@row_seperator + "\n")
        end
        attr_reader :board
        def initialize
            @@isGameOver = false
            @@play_count = 0
            @@played_board = $board
            @@player = 1
            @@positions_1 = []
            @@positions_2 = []
        end
        def play
            print_board
            initialize
            while !@@isGameOver && @@play_count < 9 do
                if @@player == 1
                    choice_1 = player_selection(@@positions_1+@@positions_2)
                    mark_board(choice_1, 'X')
                    @@positions_1 << choice_1
                    if player_has_won?(@@positions_1)
                        puts 'Player1 won'
                        @@isGameOver = true
                    end
                    @@player += 1
                elsif @@player == 2
                    choice_2 = player_selection(@@positions_1+@@positions_2)
                    mark_board(choice_2, 'O')
                    @@positions_2 << choice_2
                    if player_has_won?(@@positions_2)
                        puts 'Player2 won'
                        @@isGameOver = true
                    end
                    @@player -= 1
                end
            end
            if @@play_count = 9 && !@@isGameOver
                puts 'The game is draw!!'
            end
        end
        def player_has_won?(marks)
            return $LINES.any? do |line|
                line.all? {|position| marks.include?(position)}
            end
        end
        def player_selection(positions)
            begin
                puts "Player #{@@player} Please Enter The Number To Mark"
                selection = gets.chomp.to_i
            end while (positions).include?(selection) 
            return selection
        end
        def mark_board(choice, mark)
            @@played_board = @@played_board.map do |row| 
                row.map {|cell| cell == choice ? mark : cell}
            end
            puts @@played_board.map { |row| row.join(@@col_seperator) }.join("\n" + @@row_seperator + "\n")
            @@play_count += 1
        end
    end
end

include TicTacToe
Game.new.play