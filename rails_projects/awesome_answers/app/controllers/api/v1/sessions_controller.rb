class Api::V1::SessionsController < Api::ApplicationController
    def create
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: { id: user.id }
        else
            render(
                json: { status: 404 },
                status: 404
            )
        end
    end
    #=====POSTMAN create====>
    #name: sessions#create
    #request: POST -> http://localhost:3000/api/v1/session
    #Headers: key: Content-Type, value: application/json
    #Body: raw, JSON
    #Example session user: {"email": "admin@user.com", "password": "123"}
    #**Remember, this will only work if a user credentials exist in database
    #================>

    def destroy
        session[:user_id] = nil
        render json: {id: nil}
    end
    #=====POSTMAN destroy====>
    #name: sessions#destroy
    #request: DELETE -> http://localhost:3000/api/v1/session
    #================>
end
