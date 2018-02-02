# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create publishers
Faker::Config.locale = 'en-US'

album_covers = %w(01-13264.jpg 01-16464.jpg 01-22123.jpg 01-30516.jpg 01-32141.jpg 01-71036.jpg 01-87030.jpg 01-104752.jpg 01-114179.jpg 01-164624.jpg 01-185307.jpg 01-193027.jpg 01-239500.jpg 01-259743.jpg 01-261563.jpg 01-270830.jpg 01-272291.jpg 01-280898.jpg 01-400138.jpg 01-529388.jpg 01-645766.jpg 01-765500.jpg 01-793133.jpg 01-796741.jpg 01-817946.jpg 01-928210.jpg 01-975497.jpg 01-983190.jpg 65RG3g4K.jpg phkeDewW.jpg)

[Publisher, Album, Song, Artist].each do |model|
  model.delete_all
end

puts "Generating Fake Data"
puts "===================="

puts
print 'Creating publishers'
5.times do
  Publisher.create name: Faker::Company.name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip.to_i,
    phone:  [
      Faker::PhoneNumber.area_code, '-',
      Faker::PhoneNumber.exchange_code, '-',
      Faker::PhoneNumber.subscriber_number
    ].join,
    url: Faker::Internet.url
  print '.'
end

puts
print 'Creating artists'
20.times do
  Artist.create name: [Faker::Name.first_name, Faker::Name.last_name].join(' ')
  print '.'
end

puts
print 'Creating albums'
Publisher.pluck(:id).each do |publisher_id|
  6.times do |i|
    Album.create publisher_id: publisher_id,
      name: Faker::Hipster.words(rand(4)+1, false, false).join(' ').titleize,
      cover_art: "/art/#{album_covers.pop}",
      released_on: Faker::Date.between(2.years.ago, Date.today).to_date
    print '.'
  end
end

puts
print 'Creating songs'
artist_ids = Artist.pluck(:id)
Album.pluck(:id).each do |album_id|
  random_artist = artist_ids.pop
  artist_ids = Artist.pluck(:id) if artist_ids.empty?
  random_number_of_songs = 6 + rand(4)
  random_number_of_songs.times do
    Song.create name: Faker::Hipster.sentence(1, false, 4),
      album_id: album_id,
      artist_id: random_artist
    print '.'
  end
end

puts
puts "Complete"
puts "===================="
