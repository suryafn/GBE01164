require_relative '../database/db_connector.rb'
class User
    attr_reader :id, :username, :password, :email, :bio, :display_name
    def initialize(params)
        @id=params[:id]
        @username=params[:username]
        @password=params[:password]
        @email=params[:email]
        @bio=params[:bio]
        @display_name=params[:display_name]
    end

    def save
        return 422 if !valid? || exist?

        client = create_db_client
        client.query("Insert into user(username, password, email, bio, display_name) values
        ('#{username}','#{password}', '#{email}', '#{bio}', '#{display_name}')")
        200
    end

    def exist?
        client = create_db_client
        raw_data = client.query("select * from user where username='#{@username}' or email = '#{@email}'")
        raw_data.each[0] !=nil
    end

    def valid?
        return false if username.nil? || password.nil? || email.nil?

        true
    end
end