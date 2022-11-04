class AnswersController < ApplicationController

  before_action :find_question
  before_action :authenticate_user!
  # before_action :authorize_user!, only: [:destroy]

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    if @answer.save
      # AnswerMailer.hello_world.deliver_now
      # AnswerMailer.new_answer(@answer).deliver_now
      # AnswerMailer.delay(run_at: 30.seconds.from_now).new_answer(@answer)
      AnswerMailer.new_answer(@answer).deliver_later
      # if saved successfully then redirect to the show page of the question
      # otherwise still go to this show page but using render
      # the difference between redirect and render
      # redirect is sending a get request "questions/:id"
      # render is rendering the page
      flash[:success] = "Answer successfully created"
      redirect_to @question
    else
      # we want to stay on the page
      @answers = @question.answers.order(created_at: :desc)
      # "/questions/show" is not the action
      # it's the page /questions/show.html.erb
      render '/questions/show', status: 303
    end
  end

  def destroy
    @answer = Answer.find params[:id]
    if can?(:crud, @answer)
      @answer.destroy
      redirect_to question_path(@answer.question)
      flash[:success] = "Answer deleted"
    else
      redirect_to root_path, alert: "Not athorized to change Answer!"
    end
  end
  
  private

  def find_question
    @question = Question.find params[:question_id]
  end
 
  def answer_params
    params.require(:answer).permit(:body)
  end

  # def authorize_user!
  #   redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @answer)
  # end

end
