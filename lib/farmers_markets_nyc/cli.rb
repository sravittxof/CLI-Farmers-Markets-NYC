require 'pry'
class CLI

    def call
        puts "\n"
        puts "\n"
        puts "\n"
        puts "Welcome to Farmers Markets NYC, where you can find information about farmers markets in your neighborhood!\nUse the menu below to get started. Enter the number next to the menu option you are interested in to see more information.\n"
        @input = nil
        while @input!= "exit"
            main_menu { handle_main_menu }
        end
    end

    def get_user_input
        @input = gets.chomp.strip.downcase
    end

    def main_menu
        puts "\n"
        puts "1. Find farmers markets using filters"
        puts "2. List all farmers markets"
        puts "Type 'exit' to exit the program\n"
        yield
    end

    def handle_main_menu
        get_user_input
        
        if @input.to_i == 1
           find_markets { handle_find_markets }
        elsif @input.to_i == 2
            list_all_markets { handle_list_all_markets }
        else
            puts "Sorry, I don't understand. Please make a valid selection or type 'exit' to exit the program.\n"
        end
    end

    def find_markets
        puts "\n"
        puts "Sorry! this feature is unavailable at the moment.\n"
        puts "Type 'menu' to return to the main menu."
        #puts "Please select a filter."
        #puts "1. Borough"
        #puts "2. Days of Operation"
        #puts "3. Accepts EBT\n"
        puts "\n"
        yield
    end

    def handle_find_markets
        get_user_input
        if @input == "menu"
            back_to_main_menu
        else
            puts "Sorry, I don't understand. Please make a valid selection.\n"
        end
        #if @input.to_i == 1
        #    find_markets_by_criteria("borough") { handle_find_markets_by_criteria }
        #elsif @input.to_i == 2
        #    find_markets_by_criteria("daysoperation") { handle_find_markets_by_criteria }
        #elsif @input.to_i == 3
        #    find_markets_by_criteria("accepts_ebth") { handle_find_markets_by_criteria }
        #else
        #    puts "Sorry, I don't understand. Please make a valid selection or type 'exit' to exit the program.\n"
        #end
    end

    #def find_markets_by_criteria(criteria)
     #   criteria_values = []
      #  Market.all.each do |market|
      #      market[criteria] << criteria_values
     #   end
     #   criteria_values.uniq!
     #   yield
    #end

    #def handle_find_markets_by_criteria
    #    puts "working"
    #end


    def list_all_markets
        counter = 1
        Market.all.each do |market|
            puts "#{counter}  #{market.marketname}"
            puts "     #{market.streetaddress}, #{market.borough}\n"
            puts "\n"
            counter +=1
        end
            puts "\n"
            puts "Enter the number next to a market to see more info"
            puts "Or type 'menu' to go back to main menu"
            puts "\n"
            puts "\n"
        yield
    end

    def handle_list_all_markets
        get_user_input
        if @input == (@input.to_i >=1) && (@input.to_i <= Market.all.count) == true
            show_individual_market_info(@input) { handle_show_individual_market_info }
        elsif @input == "menu"
            back_to_main_menu
        else
            puts "Sorry, I don't understand. Please make a valid selection.\n"
        end
    end
  
    def show_individual_market_info(input)
        @input = input.to_i
        @input  -= 1
        selected_market = Market.all[@input]
        puts "\n"
        puts "#{selected_market.marketname}"
        puts "#{selected_market.streetaddress}"
        puts "#{selected_market.borough}"
        puts "Days of operation - #{selected_market.daysoperation}"
        puts "Hours of operation - #{selected_market.hoursoperations}"
        puts "Accepts EBT cards - #{selected_market.accepts_ebt}\n"
        puts "\n"

        puts "Type 'back' to back to list of all markets."
        puts "Type 'menu' to go back to the main menu."
        yield
    end

    def handle_show_individual_market_info
        get_user_input
        if @input == "back"
            list_all_markets { handle_list_all_markets }
        elsif @input == "menu"
            back_to_main_menu
        else
            puts "Sorry, I don't understand. Please make a valid selection.\n"
        end
    end

    def back_to_main_menu
        main_menu { handle_main_menu }
    end

end
