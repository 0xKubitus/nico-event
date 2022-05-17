class AttendanceMailer < ApplicationMailer
    #default from: 'event-booked@kubitus.fr'
    belongs_to :attendee, class_name: "User"
    belongs_to :event
    def booking_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'https://git.heroku.com/potatosaurusflex.git' # <= page d'accueil mon site, à modifier vers une page 'login'
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Event-Project | Réservation enregistrée !') 
    end
  end