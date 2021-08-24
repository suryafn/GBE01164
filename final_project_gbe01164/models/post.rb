# frozen_string_literal: true

require_relative '../database/db_connector'
require_relative 'hashtag.rb'
require 'date'
# class to make a post
class Post
  attr_reader :id, :user_id, :text, :attachment, :date

  def initialize(params)
    @id = params[:id]
    @user_id = params[:user_id]
    @text = params[:text]
    @attachment = params[:attachment]
    @date = params[:date]
  end

  def save
    return 422 if !valid? || !exist?

    client = create_db_client
    date = DateTime.now.to_s
    client.query("Insert into post(user_id, text, attachment, date) values
    ('#{@user_id}','#{text}', '#{attachment}', '#{date}')")
    id = client.last_id
    hashtags = Hashtag.split_hashtag(text)
    hashtags.each do|hashtag|
        tag = Hashtag.new({hashtag_name: hashtag, last_used: date})
        last_id = tag.save
        puts last_id
        client.query("insert into hashtagInPost(post_id, hashtag_id) values(#{id}, #{last_id})")
    end
    200
  end

  def exist?
    client = create_db_client
    raw_data = client.query("select * from user where id='#{@user_id}'")
    raw_data.each[0] != nil
  end

  def valid?
    return false if text.nil? && attachment.nil?

    true
  end
end
# comment = Post.new({text: 'ini p#ostingan #GGwp', user_id: 12})
# puts comment.save