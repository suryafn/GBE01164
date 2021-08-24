require_relative '../models/post.rb'
class Post_controller
    def save(params)
        post = Post.new(params)
        result = post.save

        if result==200
            return {
                'status' => result,
                'message' => 'Success',
                'data' => 'success save post'
            }
        else
            return {
                'status' => result,
                'message' => 'Fail',
                'data' => "Error code #{result}"
            }
        end

    end
end
post = Post_controller.new

puts post.save({text: 'ini p#ostingan #GGwp', user_id: 12})
