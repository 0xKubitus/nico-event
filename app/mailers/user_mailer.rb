class UserMailer < ApplicationMailer
  #default from: 'n.cubilier@gmail.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://git.heroku.com/potatosaurusflex.git' # <= page d'accueil mon site, à modifier vers une page 'login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez Potatosaurusflex by Dhoshi ! (compte utilisateur créé)') 
  end

  def admin_booking_email(attendance) 
    @admin = attendance.event.admin
    @attendee = attendance.attendee
    @event = attendance.event
    @url  = 'https://git.heroku.com/potatosaurusflex.git'
    mail(to: @admin.email, subject: 'Une réservation a été passée sur ton Event !') 
  end


end # fin class UserMailer

