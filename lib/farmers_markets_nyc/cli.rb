
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

    def main_menu
        puts "1. Find farmers markets"
        puts "2. List all markets"
        puts "Type 'exit' to exit the program"
        yield
    end

    def handle_main_menu
        get_user_input
        input = @input
        if input === "1"
            search_markets { handle_search_markets }
        elsif input === "2"
            list_all_markets { handle list_all_markets }
        end
    end

    def list_all_markets
        Market.all.each do |market|
            puts "#{market.name}"
            puts "#{market.streetaddress}"
            puts "#{market.borough}"
        end
            puts "1. Go back to main menu"
            puts "Type 'exit' to exit program"
        yield
    end

    def handle_list_all_markets
        get_user_input
        input = @input
        if input === "1"
            back_to_main_menu
        elsif input === "2"
            puts ""
        end
    end
    
    def back_to_main_menu
        main_menu { handle_main_menu }
    end


end
