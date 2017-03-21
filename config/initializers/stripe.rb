# Store the environment variables on the Rails.configuration object
# what is this configuration object anyway?

Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: ENV['STRIPE_SECRET_KEY']
}

# Set our app-stored secret key with Stripe
# waht doe this line do? does it allow us to access the secret_key of the stripe key?
Stripe.api_key = Rails.configuration.stripe[:secret_key]
