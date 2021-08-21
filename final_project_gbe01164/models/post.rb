# frozen_string_literal: true

require_relative '../database/db_connector'
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
    return false if !valid? || !exist?

    client = create_db_client
    client.query("Insert into post(user_id, text, attachment, date) values
    ('#{@user_id}','#{text}', '#{attachment}', '#{date}')")
    true
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
