# deals with managing, creating, deleting Premium Membership

class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      # this submits the key that allows the app to access the stripe api
      # what's the difference between a publishable_key and a secret_key
      key: "#{Rails.configuration.stripe[:publishable_key]}",
      description: "BigMoney Membership - #{current_user.email}",
      amount: Amount.default
    }
  end

  def create
      customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
      # how is this generated?
      )

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: Amount.default,
        description: "BigMoney Membership - #{current_user.email}",
        currency: 'usd'
      )

      if current_user.standard?
        logger.warn(current_user.inspect)
        current_user.update_attributes(role: "premium")

        logger.warn(current_user.inspect)

      end
      flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
      redirect_to edit_user_registration_path

# what is this?
      rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path
    end

  end
