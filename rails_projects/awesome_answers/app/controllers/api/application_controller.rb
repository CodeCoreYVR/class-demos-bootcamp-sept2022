class Api::ApplicationController < ApplicationController
    skip_before_action :verify_authenticity_token

    def not_found
        render(
            json: {
                errors: [
                    {
                        type: "Not found"
                    }
                ]
            },
            status: :not_found #alias for 404 in rails
        )
    end

    private

    def authenticate_user!
        unless current_user.present?
            render(json:{status:401})
        end
    end
end
