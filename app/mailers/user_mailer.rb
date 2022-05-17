class UserMailer < ApplicationMailer
  #default from: 'n.cubilier@gmail.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://eventbrite-nico.herokuapp.com/' # <= page d'accueil mon site, à modifier vers une page 'login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez The Events Project by Kubitus ! (compte utilisateur créé)') 
  end




end # fin class UserMailer
