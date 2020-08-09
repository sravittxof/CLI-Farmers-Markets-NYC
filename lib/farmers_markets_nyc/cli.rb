
class CLI

    def call
        puts "Welcome to Farmers Markets NYC, where you can find information about farmers markets in your neighborhood!\nUse the menu below to get started. Enter the number next to the menu option you are \n interested in to see more information. You can or type 'exit' at any time to exit the program."
        @input = nil
        while @input!= "exit"
        main_menu { handle_main_menu }
        end
    end

    def get_user_input
        @input = gets.strip.downcase
    end
=begin
    def main_menu
        puts "1. List Markets Info"
        puts "2. Find trees near me"
        puts "Type 'exit' to exit the program"
        yield
    end

    def handle_main_menu
        get_user_input
        input = @input
            if input === "1"
             fun_facts { handle_fun_facts }
            elsif input === "2"
                find_trees_near_me
            end
    end

    def fun_facts
        puts "Choose from the following options"
        puts "1. City wide facts"
            #how many trees in the city
            #most common species of tree in the city
            #tree health in the city
        puts "2. Facts by borough"
            #how many trees in each borough
            #most common species of tree in each borough
            #tree health by borough
        puts "3. Return to main menu"
        puts " Exit"
        yield
    end

    def handle_fun_facts
        get_user_input
        input = @input
            if input === "1"
                city_wide_facts { handle_city_wide_facts }
            elsif input === "2"
                facts_by_borough { handle_facts_by_borough }
            elsif input === "3"
                back_to_main_menu
            end
    end

    def city_wide_facts
        puts "As of 2015 there were #{Tree.all.length} trees in NYC"
        puts "1. Return to Fun Facts"
        puts "2. Return to Main Menu"
        yield
    end

    def handle_city_wide_facts
        get_user_input
        input = @input
        if input === "1"
            fun_facts { handle_fun_facts }
        elsif input === "2"
            back_to_main_menu
        end
    end

    def facts_by_borough
        puts "These are facts by borough"
        puts "1. Return to Fun Facts"
        puts "2. Return to Main Menu"
        yield
    end

    def handle_facts_by_borough
        get_user_input
        input = @input
        if input === "1"
            fun_facts { handle_fun_facts }
        elsif input === "2"
            back_to_main_menu
        end
    end
=end
    def back_to_main_menu
        main_menu { handle_main_menu }
    end


end