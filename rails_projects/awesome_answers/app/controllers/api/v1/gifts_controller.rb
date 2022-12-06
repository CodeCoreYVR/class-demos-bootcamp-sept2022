class Api::V1::GiftsController < Api::ApplicationController

  def create
    #  generate a new gift => with a status of "pending"
    #  if this gift can be saved into the db
    gift = Gift.new(amount: params[:amount])
    answer = Answer.find_by_id(params[:answer_id])
    gift.sender = current_user
    gift.receiver = answer.user
    gift.answer = answer
    gift.status = "pending"

    if gift.save
      # generate a stripe request to send to stripe to tell them to charge this customer
      Stripe.api_key = 'sk_test_51LZdCRC8F8tuRxQ8ejRWaMiLuVFOOZMB9QX6m1hZ1g1O0m09X5lPLgUCg3qAyDO2XyoVJo3jufcB3xs3pVvdycbd0069CC2fzp'
      # Token is created using Stripe Checkout or Elements
      # Get the payment token ID submitted by the form:
      token = params[:stripeToken]
      charge = Stripe::Charge.create({
        amount: params[:amount],
        currency: 'usd',
        description: 'a new gift',
        source: token
      })
    
      # if it's paid => set the status to 'success' => response to the front-end
      if charge&.paid
        gift.update(status: "Success", payment_id: charge.id)
        render(json:{status:200}, msg: "success")
      else # otherwise => set the status to "failed" => respond failed to the front-end
        gift.update(status: 'failed')
        render(json:{status:500}, msg: "failed")

      end
    else
      render(json:{status:401, msg: "check the params"})
    end
  end

end
