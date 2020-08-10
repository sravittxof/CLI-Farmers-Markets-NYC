require 'pry'
require 'open-uri'
require 'net/http'
require 'json'
require 'dotenv/load'
require "irb"

require_relative "farmers_markets_nyc/version"
require_relative "farmers_markets_nyc/api"
require_relative "farmers_markets_nyc/market"
require_relative "farmers_markets_nyc/cli"



module FarmersMarketsNyc
  class Error < StandardError; end
  # Your code goes here...
end




