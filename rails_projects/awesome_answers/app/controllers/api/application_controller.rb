class Api::ApplicationController < ApplicationController
    skip_before_action :verify_authenticity_token

    #rescue_from PRIORITY
    #The priority of rescue_from is in the reverse order of where the calls are made,
    #meaning that the more specific erorrs should be rescued last and general errors
    #(like StandardError) should be recued first

    #The StandardError class is an ancestor of all the errors that programmers could possibly 
    #cause in their program.  Rescuing from it will prevent nearly all errors from crashing the program
    #Note: Use this very carefully and make sure to always log the error messages in some form

    rescue_from StandardError, with: :standard_error

    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

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

    protected

    def standard_error(error)
        logger.error error.full_message

        render(
            status: 500, #alias :internal_server_error
            json: {
                errors: [
                    {
                        type: error.class.to_s,
                        message: error.message
                    }
                ]
            } 
        )

    end

    def record_invalid(error)
        #Our object should look something like this:
        # json: {
        #     errors: [
        #         {
        #             type: "ActiveRecord:InvalidRecord",
        #             record_type: "Question",
        #             field: "body",
        #             message: "..."
        #         }
        #     ]
        # }

        invalid_record = error.record
        errors = invalid_record.errors.map do |field, message|
            {
                type: invalid_record.class.to_s,
                field: field,
                message: message
            }
        end
        render(
            json: { status: 422, errors: errors },
            status: 422 #alias :unprocessable_entity
        )
    end
end
