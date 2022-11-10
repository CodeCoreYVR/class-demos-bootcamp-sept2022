class Api::V1::QuestionsController < Api::ApplicationController
    before_action authenticate_user!, except: [:index, :show]
    
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
        question = Question.new(question_params)
        # question.user = User.first #hard code user for now
        question.user = current_user
        if question.save
            render json: { id: question.id }
        else
            render(
                json: {errors: question.errors.messages },
                status: 422 #unprocessable entity HTTP status code
            )
        end
    end

    def update
        question = Question.find(params[:id])
        if question.update(question_params)
            render json: {id: question.id }
        else
            render(
                json: { errors: question.errors.messages },
                status: 422
            )
        end
    end

    def destroy
        question = Question.find(params[:id])
        if question.destroy
            # head :ok
            render(
                json: { status: 200 }
            )
        else
            # head :bad_request
            render( json: {status: 500})
        end
    end

    private

    def question_params
        params.require(:question).permit(:title, :body, :tag_names)
    end
end

