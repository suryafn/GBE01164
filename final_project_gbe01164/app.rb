require 'sinatra'
require 'json'
require_relative 'database/db_connector.rb'
require_relative 'controllers/user_controller.rb'
require_relative 'controllers/post_controller.rb'
require_relative 'controllers/comment_controller.rb'

post '/api/register' do
    controller = User_controller.new
    result = controller.save(params)

    return result.to_json
end

post '/api/new_post' do
    controller= Post_controller.new
    result = controller.save(params)

    return result.to_json
end

post '/api/new_comment' do
    controller= Comment_controller.new_item
    result = controller.save(params)

    return result.to_json
end