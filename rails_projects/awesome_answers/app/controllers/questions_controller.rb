class QuestionsController < ApplicationController

  # To create this controller:
  # rails g controller questions --no-helper --no-assets
  # if you don't need helper.rb and questions.scss files
  # you can add those options when you run rails g controller
  # If you want to configure it so these files are not created by default,
  # you can configure it in config/application.rb

  # ===============CALLBACKS====================
  before_action :find_question, only: [:edit, :update, :show, :destroy]

  before_action :authenticate_user!, except: [:index, :show]

  before_action :authorize_user!, only:[:edit, :update, :destroy]

  # ===============CREATE========================
  def new
    # Because Rails form helper methods need an instance of a model to work, we create a new instance
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:success] = "Question successfully created"
      redirect_to @question
      # redirect_to question_path(@question)
      # ^^older syntax
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  # ============================READ=======================================
  def index
    # @questions = Question.order(created_at: :desc)
    # Model.all is a method built into active record used to return all records of that model
    # the @ sign is necessary to make a variable an instance variable
    # You need instance variables to make it available in the view pages!!!

    if params[:tag]
      @tag = Tag.find_or_initialize_by(name: params[:tag])
      @questions = @tag.questions.order(updated_at: :desc)
    else
      @questions = Question.order(created_at: :desc)
      respond_to do |format|
        format.html { render }
        format.json {render json: @questions}
      end
    end
  end

  def show
    @answers = @question.answers.order(created_at: :desc)
    @answer = Answer.new
    @like = @question.likes.find_by(user: current_user)
    #@like = Like.find_by(question: @question, user: current_user)
    #We use the likes of the @question to see if there is arecord that user_id is the current_user
    #if there is a record, @like is that association
    #id not, @like will be nil
  end

  # ===========================UPDATE=====================================
  def edit
    
  end

  def update
    if @question.update(question_params)
      flash[:success] = "Question successfully updated"
      redirect_to @question
      # redirect_to question_path(@question)
      # ^^older syntax
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  # ============================DELETE=====================================
  def destroy
    @question.destroy
    redirect_to questions_path
  end

  #This controller acrtion will be used to show all the questions likied by the current user:
  def liked
    @questions = current_user.liked_questions
  end

  private

  def find_question
    @question = Question.find params[:id]
  end
  # ^^ This finds a singular question by getting the :id
  # we end up reusing this line thats why we make it a private method

  # As an added layer of protection to our database,
  # and to prevent malicious SQL injection, we only permit users
  # to inject data for the required params in the form,
  # related to the given model:
  def question_params
    params.require(:question).permit(:title, :body, :tag_names)
    # get the data from the form and add it into the DB
    # Use the 'require' on the params object to retrieve the nested hash of a key
    # usually corresponding the key-value pairs of a form
    # 'permit' to specify all input names are allowed to submit to the DB
  end

  def authorize_user!
    redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @question)
  end
  
  
end
