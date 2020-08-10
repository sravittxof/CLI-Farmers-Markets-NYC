
class API

    def get_markets_data
        url = "https://data.cityofnewyork.us/resource/8vwk-6iz2.json"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        @markets = JSON.parse(response.body)
        Market.new_from_collection(@markets)
    end

end

