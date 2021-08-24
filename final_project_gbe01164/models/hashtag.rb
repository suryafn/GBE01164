require_relative '../database/db_connector.rb'

class Hashtag
    attr_reader :id, :hashtag_name, :last_used
    def initialize(params)
        @id=params[:id]
        @hashtag_name=params[:hashtag_name]
        @last_used=params[:last_used]
    end

    def self.split_hashtag(text)
        text = text.downcase
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

    def save
        client = create_db_client
        if exist?
            client.query("update hashtag set last_used='#{@last_used}' where hashtag_name = '#{@hashtag_name}' ")
            rawData=client.query("select * from hashtag where hashtag_name = '#{@hashtag_name}'")
            return rawData.each[0]["id"]
        else
            client.query("insert into hashtag(hashtag_name, last_used) values('#{@hashtag_name}', '#{last_used}')")
            return client.last_id
        end
    end

    def exist?
        client = create_db_client
        raw_data = client.query("select * from hashtag where hashtag_name='#{@hashtag_name}'")
        raw_data.each[0] != nil
    end

    def valid?
        return false if hashtag_name.nil?

        true
    end
end