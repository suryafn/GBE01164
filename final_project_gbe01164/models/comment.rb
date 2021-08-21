require_relative '../database/db_connector.rb'
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
        return false if !valid? || !exist?
        client = create_db_client
        client.query("Insert into comment(text, attachment, user_id, post_id, date) values
        ('#{text}','#{attachment}', '#{user_id}', '#{post_id}', '#{date}')")
        true
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

# # comment = Comment.new({text: 'ular dan pak umar', post_id: 13, user_id: 12, date: '2020-01-01 10:10:10'})
# puts comment.save
# text = "coba coba"
