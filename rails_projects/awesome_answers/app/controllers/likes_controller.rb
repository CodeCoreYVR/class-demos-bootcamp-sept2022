class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

    def create
        @question = Question.find params[:question_id]
        @like = Like.new(question: @question, user: current_user)

        if can?(:like, @question)
            if @like.save
                flash.notice = "Question liked"
            else
                flash.alert = @like.errors.full_messages.join(", ")
            end
        else
            flash.alert = "You cannot like this question!"
        end
        redirect_to question_path(@question)
    end

    def destroy
       @like = current_user.likes.find params[:id]

       if !can?(:destroy, @like)
        flash[:warning] = "You cannot destroy a like you don't own!"
       elsif @like.destroy
        flash[:success] = "Question Unliked"
       else
        flash[:warning] = "Couldn't Unlike the question..."
       end
       redirect_to question_path(@like.question)
    end
end
