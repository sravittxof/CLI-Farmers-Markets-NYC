require 'pry'
class CLI

    def call
        puts "Welcome to Farmers Markets NYC, where you can find information about farmers markets in your neighborhood!\nUse the menu below to get started. Enter the number next to the menu option you are \n interested in to see more information. You can or type 'exit' at any time to exit the program."
        @input = nil
        while @input!= "exit"
            main_menu { handle_main_menu }
        end
    end

    def get_user_input
        @input = gets.chomp.strip.downcase
    end

    def main_menu
        puts "1. Find farmers markets"
        puts "2. List all farmers markets"
        puts "Type 'exit' to exit the program"
        yield
    end

    def handle_main_menu
        get_user_input
        if @input.to_i == 1
            find_markets { handle_find_markets }
        elsif @input.to_i == 2
            list_all_markets { handle_list_all_markets }
        else
            puts "Sorry, I don't understand. Please make a valid selection or type 'exit' to exit the program."
        end
    end

    def find_markets
        puts "Please select a filter."
        puts "1. Borough"
        puts "2. Days of Operation"
        puts "3. Accepts EBT"
        yield
    end

    def handle_find_markets
        get_user_input

        if @input.to_i == 1
            find_markets_by_criteria("borough") { handle_find_markets_by_criteria }
        elsif @input.to_i == 2
            find_markets_by_criteria("daysoperation") { handle_find_markets_by_criteria }
        elsif @input.to_i == 3
            find_markets_by_criteria("accepts_ebth") { handle_find_markets_by_criteria }
        else
            puts "Sorry, I don't understand. Please make a valid selection or type 'exit' to exit the program."
        end
    end


    def find_markets_by_criteria(criteria)
        criteria_values = []
        Market.self.all.each do |market|
            market[criteria] << criteria_values
        end
        criteria_values.uniq!
        yield
    end

    def handle_find_markets_by_criteria

    end


    def list_all_markets
        counter = 1
        Market.all.each do |market|
            puts "#{counter}  #{market.marketname}"
            puts "      #{market.streetaddress}"
            puts "      #{market.borough}"
            counter +=1
        end
            puts "Enter the number next to the market to see more info"
            puts "Type 'menu' to go back to main menu"
            puts "Type 'exit' to exit program"
        yield
    end

    def handle_list_all_markets
        get_user_input
        if (@input.to_i >=1) && (@input.to_i <= Market.all.count) == true
            show_individual_market_info(@input) { handle_show_individual_market_info }
        elsif @input == "menu"
            back_to_main_menu
        else
            puts "Sorry, I don't understand. Please make a valid selection or type 'exit' to exit the program."
        end
    end
  
    def show_individual_market_info(input)
        @input = input.to_i
        @input  -= 1
        selected_market = Market.all[@input]
        puts "#{selected_market.marketname}"
        puts "#{selected_market.streetaddress}"
        puts "#{selected_market.borough}"
        puts "Days of operation - #{selected_market.daysoperation}"
        puts "Hours of operation - #{selected_market.hoursoperations}"
        puts "Accepts EBT cards - #{selected_market.accepts_ebt}"

        puts "1. Go back to list of all markets."
        puts "2. Go back to the main menu."
        puts "Type 'exit' to exit the program."
        yield
    end

    def handle_show_individual_market_info
        get_user_input
        if @input.to_i == 1
            list_all_markets { handle_list_all_markets }
        elsif @input.to_i == 2
            back_to_main_menu
        else
            puts "Sorry, I don't understand. Please make a valid selection or type 'exit' to exit the program."
        end
    end

    def back_to_main_menu
        main_menu { handle_main_menu }
    end



end


=begin            
        elsif @input.to_i == 2
            counter = 1
            days = Market.get_attribute_values("daysoperation")
            days.each do |day|
                puts "#{counter}. #{day}"
                counter += 1
            end
        elsif @input.to_i == 3
            counter = 1
            ebt = Market.get_attribute_values("accepts_ebt")
            ebt.each do |ebt|
                puts "#{counter}. #{ebt}"
                counter += 1
            end
=end
