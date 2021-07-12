require 'sinatra'

get '/messages' do
    '<h1 style="background-color:DodgerBlue;">Hello World!</h1>'
end

# get '/messages/:name' do
#     name = params['name']
#     "<h1 style=\"background-color:DodgerBlue;\">Hello #{name}!</h1>"
# end
get '/messages/:name' do
    name = params['name']
    color = params['color'] ? params['color'] : 'DodgerBlue'
    erb :message, locals:{
        color: color,
        name: name
    }
end


post '/login' do
    if params['username'] == 'admin' && params['password'] == 'admin'
        return "Login"
    else
        redirect '/login'
    end
end

get '/login' do
    erb :login
end