ActionMailer::Base.smtp_settings = {
  port: 587,
  address: 'smtp.mailgun.org',
  user_name: ENV['MAILGUN_SMTP_LOGIN'],
  password: ENV['MAILGUN_SMTP_PASSWORD'],
  domain: 'app0c7b1958a21e4660bc9edf832dd02c06.mailgun.org',
  authentication: :plain,
  content_type: 'text/html',
  enable_starttls_auto: true
}