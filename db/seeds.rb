# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "******************"
puts "*** Delete all ***"
puts "******************"

print "Delete status history"
StatusHistory.destroy_all
puts " [x]"

print "Delete Appointments"
Appointment.destroy_all
puts " [x]"

print "Delete Appointment type"
AppointmentType.destroy_all
puts " [x]"

print "Delete users"
User.destroy_all
puts " [x]"

puts "@@@@@@@@@@@@@@@@@@"
puts "@@@ Create all @@@"
puts "@@@@@@@@@@@@@@@@@@"

print "Status types created by migration"


print "Create appointment types"
AppointmentType.create(name: 'closed', bookable: false)
AppointmentType.create(name: '1ére consultation', duration: '01:00:00', price: '60.00', bookable: true)
AppointmentType.create(name: '2nde consultation', duration: '00:45:00', price: '60.00', bookable: true)
AppointmentType.create(name: 'Pédiatrique', duration: '01:00:00', price: '60.00', bookable: true)
puts " [x]"

print "Create users"
User.create(email:'mdesrosiers@orange.fr', password: '123soleil')
User.create(email:'mdesrosiers@world.com', password: '123soleil')
User.create(email:'mdesrosiers@univers.com', password: '123soleil')
puts " [x]"

print "Create appointments "
20.times do
  Appointment.create( user: User.all.sample,
                      appointment_type: AppointmentType.all.sample,
                      start_date: (Time.now+rand(10).day),
                      end_date: "22/08/2018 12:00:00",
                      review: "Top moumoutte",
                      rate: 4)
end
puts " [x]"

print "Create status histories"
StatusHistory.create(
    date: (Time.now-3.day),
    status_type_id: 1,
    appointment: Appointment.first)
StatusHistory.create(
    date: (Time.now-2.day),
    status_type_id: 2,
    appointment: Appointment.first)
StatusHistory.create(
    date: (Time.now-1.day),
    status_type_id: 3,
    appointment: Appointment.first)
StatusHistory.create(
    date: (Time.now.day),
    status_type_id: 4,
    appointment: Appointment.first)
StatusHistory.create(
    date: (Time.now.day),
    status_type_id: 2,
    appointment: Appointment.second)
StatusHistory.create(
    date: (Time.now.day),
    status_type_id: 2,
    appointment: Appointment.third)
puts " [x]"

print "End of the seed processing"



