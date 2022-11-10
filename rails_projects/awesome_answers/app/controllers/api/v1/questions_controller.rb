class Api::V1::QuestionsController < Api::ApplicationController
    def index
        questions = Question.order(created_at: :desc)
        # render(json: questions)
        #If the serializer name does not match the model (like questions_serializer matches question.rb)
        #then we need to specify in the specific controller actions which serializer to use
        #with the methos "each_serializer"
        render(json: questions, each_serializer: QuestionCollectionSerializer)
    end

    def show
        question = Question.find(params[:id])
        render(json: question)
        # because question model matches with question serializer, we don't need to 
        #specify which serializer to use like we do above with index and QuestionCollectionSerializer
        # render(json: question, each_serializer: QuestionSerializer)
    end

    def create
    end

    def destroy
    end
end