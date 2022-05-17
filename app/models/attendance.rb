class Attendance < ApplicationRecord
  after_create :booking_email #permet de lancer automatiquement cette methode quand une réservation est effectuée (ce qui se traduit par la creation en base d'une 'attendance' à un 'event' par un 'user/attendee')

  #validates :stripe_customer_id,
   #presence: true,
   #format: .....???.....

   
  belongs_to :attendee, class_name: "User"
  belongs_to :event


  def booking_email

    AttendanceMailer.booking_email(self).deliver_now 

    #petit test pour voir ds. le terminal si la methode fonctionne :
    puts " "
    puts "* - *"*50
    puts "Résa validé -> email envoyé au user/attendee"
    puts "* - "*50
    puts " "
  end

end # fin class 'Attendance'
