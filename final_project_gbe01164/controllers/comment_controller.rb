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
