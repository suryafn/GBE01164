require_relative '../database/db_connector.rb'
require_relative 'hashtag.rb'
require 'date'
class Comment
    attr_reader :id, :text, :attachment, :user_id,:post_id, :date
    def initialize(params)
        @id=params[:id]
        @text=params[:text]
        @attachment=params[:attachment]
        @user_id=params[:user_id]
        @post_id=params[:post_id]
        @date=params[:date]
    end

    def save
        return 422 if !valid?
        client = create_db_client
        date = DateTime.now.to_s
        client.query("Insert into comment(text, attachment, user_id, post_id, date) values
        ('#{text}','#{attachment}', '#{user_id}', '#{post_id}', '#{date}')")
        id = client.last_id
        hashtags = Hashtag.split_hashtag(text)
        hashtags.each do|hashtag|
            tag = Hashtag.new({hashtag_name: hashtag, last_used: date})
            last_id = tag.save
            puts last_id
            client.query("insert into hashtagInComment(comment_id, hashtag_id) values(#{id}, #{last_id})")
        end
        200
    end

    def exist?
        client = create_db_client
        raw_data = client.query("select * from post where id='#{@post_id}'")
        raw_data.each[0] != nil
    end

    def valid?
        return false if text.nil? && attachment.nil?

        true
    end
end

# comment = Comment.new({text: 'ular dan pak #umar #janji_palsu iya pak umar. #GGWP', post_id: 1, user_id: 12})
# puts comment.save
