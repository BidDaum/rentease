class UserMailer < ApplicationMailer
  default from: 'contact@rentease.com'

  def simple_message
    @email = params[:email]
    @apply = Apply.find(params[:apply_id])
    mail(
      to: @email,
      subject: 'Dossier de location - #{apply.first_name} #{apply.name}',
      body: 'Lorem Ipsum'
    )
  end
end
