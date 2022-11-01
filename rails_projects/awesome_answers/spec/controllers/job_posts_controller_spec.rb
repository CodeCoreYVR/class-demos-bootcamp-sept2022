require 'rails_helper'

RSpec.describe JobPostsController, type: :controller do

  describe "#new" do

    context "with signed in user" do
      before do
        session[:user_id] = FactoryBot.create(:user).id
      end
      it "requires a render of a new template" do
        # GIVEN
        # in render there's not really a given
        # The given is just that the new action is triggered
  
        # WHEN
        get(:new)
        # We have this get method available from rails-controller-testing gem
        # In the backend is simulates/mocks the behavior of sending a http get request
  
        # THEN
        expect(response).to(render_template(:new))
        # response is an object that represents the HTTP-response 
      end
  
      it "requires setting an instance variable with a new job post" do
        # GIVEN
        # in render there's not really a given
        # The given is just that the new action is triggered
  
        # WHEN
        get(:new)
  
        # THEN
        # assigns(:job_post) is available from the gem rails-controller-testing
        # it allows you to grab an instance variable, and takes a symbol (:job_post)
        # All models are available to the controller
        expect(assigns(:job_post)).to(be_a_new(JobPost))
        # We check that the instance variable @job_post is a new instance of the model JobPost
      end
    end

    context "without signed in user" do
      it "should redirect to the sign in page" do
        get(:new)
        expect(response).to redirect_to(new_session_path)
      end
    end
    
    
  end

  describe "#create" do
    def valid_request
      post(:create, params: {
        job_post: FactoryBot.attributes_for(:job_post)
      })
    end

    context "with signed in user" do

      before do
        session[:user_id] = FactoryBot.create(:user).id
      end
      
      context "with valid parameters" do
        it "requires a new creation of a job post in the database" do
          # Given
          count_before = JobPost.count # the number of all records in the JobPost table in the db
    
          # WHEN
          valid_request
    
          # THEN
          count_after = JobPost.count
          expect(count_after).to(eq(count_before + 1))
        end
        it "requires a redirect to the show page for the new job post" do
          # GIVEN
          # we are creating a new job post
    
          # WHEN
          valid_request
    
          # THEN
          job_post = JobPost.last
          expect(response).to(redirect_to(job_post))  
          # expect(response).to(redirect_to(job_post_path(job_post.id)))
          # ^^alternate 
        end
      end
  
      context "with invalid parameters" do
        # mock a post request to the create method with invalid params
        def invalid_request
          post(:create, params: {
            job_post: FactoryBot.attributes_for(:job_post, title: nil)
          })
        end
  
        it "requires that the database does not save the new record of job post" do
          # GIVEN
          count_before = JobPost.count
  
          # WHEN
          invalid_request
  
          # THEN
          count_after = JobPost.count
          expect(count_after).to(eq(count_before))  
        end
        it "requires a render of the new job post template" do
          # GIVEN
          # on the new template of creating a new record of job post
  
          # WHEN
          invalid_request
  
          # THEN
          expect(response).to(render_template(:new))  
        end
      end
    end
    
  end

  describe "#show" do
    it "requires a render of the show template" do
      # GIVEN
      job_post = FactoryBot.create(:job_post)
      
      # WHEN
      get(:show, params: {id: job_post.id})
      
      # THEN
      expect(response).to render_template(:show)  
    end
    
    it "requires setting an instance variable @job_post for the shown object" do
      # GIVEN
      job_post = FactoryBot.create(:job_post)
      
      # WHEN
      get(:show, params: {id: job_post.id})

      # THEN
      expect(assigns(:job_post)).to eq(job_post)  
    end
  end

  describe "#index" do
    it "requires a render of the index template" do
      # GIVEN
      # triggers the index action

      # WHEN
      get(:index)

      # THEN
      expect(response).to render_template(:index) 
    end
    it "requires assigning an instance variable @post_posts which contains all the job posts" do
      # GIVEN
      job_post1 = FactoryBot.create(:job_post)
      job_post2 = FactoryBot.create(:job_post)
      job_post3 = FactoryBot.create(:job_post)
      # WHEN
      get(:index)

      # THEN
      expect(assigns(:job_posts)).to eq([job_post3, job_post2, job_post1]) 
    end
  end

  describe "#edit" do
    context "with signed in user" do
      context "as owner" do
        before do
          current_user = FactoryBot.create(:user)
          session[:user_id] = current_user.id
          @job_post = FactoryBot.create(:job_post, user: current_user)
        end
  
        it "requires the render of the edit template" do
          # GIVEN
          # WHEN
          get(:edit, params: {id: @job_post.id})
          # THEN
          expect(response).to render_template(:edit)  
        end
        
      end
      
    end
    
  end

  describe "#update" do

    context "with signed in user" do
      
      before do
        session[:user_id] = FactoryBot.create(:user).id
        @job_post = FactoryBot.create(:job_post)
      end
      context "with valid params" do
        it "requires an update to the job post record with new attributes" do
          # GIVEN
          new_title = "#{@job_post.title} plus some changes"
          # WHEN
          patch(:update, params: {id: @job_post.id, job_post: {title: new_title}})
          # THEN
          expect(@job_post.reload.title).to eq(new_title)  
        end
        it "requires a redirect to the show page of the updated job post" do
          # GIVEN
          new_title = "#{@job_post.title} plus some changes"
          # WHEN
          patch(:update, params: {id: @job_post.id, job_post: {title: new_title}})
          # THEN
          expect(response).to redirect_to(@job_post)  
        end
      end
      context "with invalid params" do
        it "requires the job post record not the be updated in the db" do
          # GIVEN
  
          # WHEN
          patch(:update, params: {id: @job_post.id, job_post: {title: nil}})
          job_post_after_update = JobPost.find(@job_post.id)
          # THEN
          expect(job_post_after_update.title).to eq(@job_post.title)
        end
        
      end
    end
    
  end

  describe "#destroy" do
    context "with signed in user" do
      context "as owner" do
        
        before do
          current_user = FactoryBot.create(:user)
          session[:user_id] = current_user.id
  
          # GIVEN
          @job_post = FactoryBot.create(:job_post, user: current_user)
          # WHEN
          delete(:destroy, params: {id: @job_post.id})
        end
    
        it "requires a record of job post to be removed from the database" do
          expect(JobPost.find_by(id: @job_post.id)).to be(nil)  
        end
        it "requires a redirect to the job posts index page" do
          expect(response).to redirect_to(job_posts_path)  
        end
        it "requires a flash message that the record was deleted" do
          expect(flash[:danger]).to be  #asserts that the danger property of the flash message exists
        end
      end
      context "not owner" do
        it "the job post shouldn't be removed" do
          # GIVEN
          job_post = FactoryBot.create(:job_post)
          session[:user_id] = FactoryBot.create(:user).id

          # WHEN
          delete(:destroy, params:{id: job_post.id})

          # THEN
          expect(JobPost.find_by(id: job_post.id)).to eq(job_post)  
        end
      end
      
    end
    
  end
  
end
