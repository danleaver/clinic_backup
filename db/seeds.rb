# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  @physician = Physician.create(
    name: "Dr. #{Faker::Name.name}"
  )

  2.times do
    @patient = Patient.create(
      name: Faker::Name.name
      
    )

    
    Appointment.create(
      appointment_date: Faker::Date.forward(days: 23),
      patient_id: @patient.id,
      physician_id: @physician.id
    )
    
    
  end
    
    
    
  end
      # appointments = Appointment.create(
      #   appointment_date = 12/27/1987,
      #   physician_id = @physician.id,
      #   patient_id = @patient.id
      # )
