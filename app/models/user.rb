class User < ApplicationRecord
  after_create :welcome_send #permet de lancer automatiquement cette methode après chaque création d'1 nouveau User

  #validates :email, :first_name, :last_name, :encrypted_password, presence: true
  #validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Donne-moi une adresse email valide stp" }
  #validates :bio, length: { in 2..500 }
  #validates :encrypted_password, format: { .....???..... }


  has_many :organized_events, foreign_key: 'admin_id', class_name: 'Event'
  has_many :events_planned, foreign_key: 'attendee_id', class_name: 'Attendance'


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
