User.destroy_all
Event.destroy_all
Attendance.destroy_all


# users :
5.times do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::TvShows::BojackHorseman.tongue_twister,
    email: "testkubitus#{i}@yopmail.com",
    encrypted_password: Faker::Lorem.characters(number: 6, min_numeric: 1)
  )
end

# events :
3.times do |i|
  event = Event.new(
    title: Faker::Fantasy::Tolkien.poem,
    description: Faker::Lorem.sentences(number: 2),
    location: Faker::Fantasy::Tolkien.location,
    start_date: Faker::Date.between(from: Date.today, to: 3.year.from_now),
    duration: (rand(1..2016) * 5), # <- 2016 x 5 = 10080 = 7 x 24 x 60 = nbre de minutes dans 7 jours
    price: rand(1..1500)
  )
  event.admin = User.all.sample # uniquement pour le debut pour tester les migrations et relations entre les objets
  event.save
end

# attendances :
Event.all.each do |event|
  x = rand(0..5)
  x.times { Attendance.create(event: event, attendee: User.all.sample) }
end


