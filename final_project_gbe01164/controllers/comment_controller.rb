require_relative '../models/comment.rb'
class Comment_controller
    def save(params)
        comment = Comment.new(params)
        result = comment.save

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

post = Comment_controller.new

puts post.save({text: 'ular dan pak #umar #janji_palsu iya pak umar. #GGWP', post_id: 1, user_id: 12})