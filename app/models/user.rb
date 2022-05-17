class User < ApplicationRecord
  after_create :welcome_send #permet de lancer automatiquement cette methode après chaque création d'1 nouveau User

  def new_guest_send(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance
    @admin = User.find(@attendance.event.admin_id)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'You have a new guest !') 
  end


  # methode pour envoyer un email automatique (cf. methode welcome_email dans "app/mailers/user_mailer.rb") :
  def welcome_send

    UserMailer.welcome_email(self).deliver_now #on utilise 'self' car ce qui nous intéresse est l'instance du user nouvellement créé

    #petit test pour voir ds. le terminal si la methode fonctionne :
    puts " "
    puts "="*50
    puts "l'email devrait être bien envoyé au user"
    puts "="*50
    puts " "
  end


  
end # fin de la classe User
