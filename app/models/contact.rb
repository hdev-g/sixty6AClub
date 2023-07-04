class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true

  def headers
    {
      to: 'harris@shoptreen.com', # change this to be the email you want sent to
      subject: '66A Club Request',
      from: 'admin@yourdomain.com',  # change this to be the email it is coming from
      reply_to: %("#{name}" <#{email}>)
    }
  end
end