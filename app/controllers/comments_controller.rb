class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ destroy ]
    before_action :authenticate_user!, only: %i[ create destroy ]
    before_action :authorize_user, only: %i[ destroy ]


    def create
        @comment = Comment.new({
            body: params["body"],
            user_id: current_user.id,
            post_id: params["post_id"]
        })
        respond_to do |format|
            if @comment.save
            format.html { redirect_to @comment.post, notice: "Comment was successfully created." }
            format.json { render :show, status: :created, location: @comment }
            else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
    post = @comment.post
    @comment.destroy

        respond_to do |format|
            format.html { redirect_to post, notice: "Comment was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :post_id, :user_id)
    end

    def authorize_user
      unless @comment.user == current_user
        redirect_to comments_path, alert: "You are not authorized!"
      end
    end
end

