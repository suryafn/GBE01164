class Number
    def self.nextof(array)
        decimal=10.pow(array.length()-1)
        sum = 0
        result = []
        if array[array.length()-1] == 9
            array[array.length()-1] +=1
            return array
        end
        for arr in array do
            sum += arr*decimal
            decimal/=10
        end
        sum+=1
        decimal=10.pow(array.length()-1)
        x=0
        while x<array.lenght()
            result.push(sum/decimal - )
        end
        
    end
end