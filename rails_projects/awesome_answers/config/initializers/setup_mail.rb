ActionMailer::Base.smtp_settings = {
    #This is the configurations for Gmail, meaning the base setup
    #to send emails will have to be Gmail
    address: "smtp.gmail.com",
    port: "587",
    enable_starttls_auto: true,
    authentication: :plain,
    user_name: ENV["EMAIL_USERNAME"],
    password: ENV["EMAIL_PASSWORD"]
}