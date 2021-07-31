class Martabak
    attr_reader :flavour
    def initialize(flavour)
        @flavour=flavour
    end
    def taste
        return "martabak #{flavour} is delicious"
    end
end