class Api::V1::QuestionsController < Api::ApplicationController
    def index
        questions = Question.order(created_at: :desc)
        render(json: questions)
    end

    def show
        question = Question.find(params[:id])
        render(json: question)
    end

    def create
    end

    def destroy
    end
end
