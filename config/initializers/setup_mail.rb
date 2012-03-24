ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "rishighan.com",
  :user_name            => "rishi.ghan@gmail.com",
  :password             => "number9ttr",
  :authentication       => "plain",
  :enable_starttls_auto => true
}