class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true

  def headers
    {
      to: 'info@kinda.works', # change this to be the email you want sent to
      subject: 'Co-working Request',
      from: %("#{name}" <#{email}>)  # change this to be the email it is coming from
    }
  end
end
