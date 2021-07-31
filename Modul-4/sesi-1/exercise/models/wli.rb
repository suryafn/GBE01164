class Wli
    attr_accessor :names
    def likes
        i=0
        result=""
        if names.nil?
            return "no one like this"
        end
        for name in names do
            if i==0
                result = result+name
            elsif i<names.length()-1
                result= result+", "+name
            else
                if result[result.length()-1]!=" "
                    result= result+" "
                end
                result= result+"and "+name
            end
            i+=1
        end
        result=result+" like this"
        result
    end
end