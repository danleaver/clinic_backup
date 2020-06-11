class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :physician

  # validates :appointment_date, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
  # @person.validates_date :appointment_date, :on_or_before => lambda { Date.current }  
  #  validates_datetime :appointment_date, :on_or_before =>  lambda { Date.current }
  #  validates_datetime :appointment_date, :on_or_before =>  lambda { Date.current }
   validates_date :appointment_date, :on_or_after => :today
  # validates_datetime :appointment_date, :before_message => "Select a date"
  end



# try this: appointment_date instead of :datetime 
#one sec brb
# k
# did you try restarting the server?