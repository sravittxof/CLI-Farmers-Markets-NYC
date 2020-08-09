
class Market

    attr_accessor :borough, :marketname, :streetaddress, :latitude, :longitude, :daysoperation, :hoursoperations, :seasondates, :accepts_ebt, :open_year_round, :location_point
    @@all = []

    def initialize(attrs)
        attrs_from_hash(attrs)
        save
      end

      def attrs_from_hash(attrs)
        attrs.each do |k, v|
            if k.to_s[0] == ":"
                next
            else
                send("#{k}=", v)
            end
        end
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_from_collection(markets)
        markets.each do |attrs|
            new(attrs)
        end 
    end

    #def self.unique_attribute_values(att)
     #   self.all.collect(self.att).uniq
    #end

    def self.get_attribute_values(attribute)
        attributes = []
        Market.all.find do |market|
            attributes << "#{market}"[attribute]
        end
        attributes.uniq
    end

end