require_relative '../database/db_connector.rb'

class Hashtag
    attr_reader :id, :hashtag_name, :last_used
    def initialize(params)
        @id=params[:id]
        @hashtag_name=params[:hashtag_name]
        @last_used=params[:last_used]
    end

    def self.split_hashtag(text)
        hashtags = Array.new
        if text.include? "#"
            split_hashtag = text.split('#')
            split_hashtag.each do |hashtag|
                tags = hashtag.split
                hashtags.push(tags[0])
            end
            hashtags.shift
        end
        hashtags
    end

    def self.save()
        
    end

    def valid?
        return false if hashtag_name.nil?

        true
    end
end