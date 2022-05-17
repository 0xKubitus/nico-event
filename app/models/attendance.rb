
class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :user, presence: true
  validates :event, presence: true
  validates :attendee_id, presence: true
  after_create :new_guest_send

  
  after_create :admin_booking_send #permet de lancer automatiquement cette methode quand une réservation est effectuée (ce qui se traduit par la creation en base d'une 'attendance' à un 'event' par un 'user/attendee')

  #validates :stripe_customer_id,
   #presence: true,
   #format: .....???.....   
  belongs_to :attendee, class_name: "User"
  belongs_to :event


  def admin_booking_send
    UserMailer.admin_booking_email(self).deliver_now
    puts " "
    puts "* - *"*50
    puts "Résa validé -> email envoyé au user/admin"
    puts "* - "*50
    puts " "
  end

end # fin class 'Attendance'
# fin class 'Attendance'
