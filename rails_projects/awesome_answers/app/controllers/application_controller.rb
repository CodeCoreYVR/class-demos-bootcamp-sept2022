class ApplicationController < ActionController::Base
    # we create these methods in ApplicationController because we will use it in some other controllers
    # and all the other controllers inherit from this ApplicationController, so we just need to 
    # define the method one time in this ApplicationController. 

    def current_user
        @current_user ||= User.find_by_id session[:user_id]
    end

    helper_method :current_user
    #helper_method makes the method also available for the views.  This is used for any method that you need to asscess from both controllers and views


    def user_signed_in?
        current_user.present?
    end

    helper_method :user_signed_in?

    def authenticate_user!
        # check if the user is signed in or not
        # if not then redirect the user to the sign in page
        # otherwise dont do anything
        redirect_to new_session_path, notice: "Please sign in" unless user_signed_in?
    end

end
