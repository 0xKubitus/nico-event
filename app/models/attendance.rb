class Attendance < ApplicationRecord
  after_create :booking_email #permet de lancer automatiquement cette methode quand une réservation est effectuée (ce qui se traduit par la creation en base d'une 'attendance' à un 'event' par un 'user/attendee')
  belongs_to :user
  belongs_to :event
  validates :user, presence: true
  validates :event, presence: true
  after_create :new_guest_send
  belongs_to :attendee, class_name: "User"
  belongs_to :event
  def new_guest_send
    UserMailer.new_guest_send(self).deliver_now
  end
   
  


end
# fin class 'Attendance'
