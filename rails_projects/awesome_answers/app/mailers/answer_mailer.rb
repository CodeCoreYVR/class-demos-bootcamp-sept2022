class AnswerMailer < ApplicationMailer

    def new_answer(answer)
        @answer = answer
        @question = answer.question
        @owner = @question.user

        mail(
            to: @owner.email,
            subject: 'You got a new answer!'
        )
    end

    def hello_world
        mail(
            to: 'stephanie@codecore.ca',
            from: 'anyone@example.com',
            cc: 'someone@else.com',
            bcc: 'another@person.com',
            subject: 'Hello World'
        )
    end
end
