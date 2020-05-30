# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

District.delete_all
Customer.delete_all
Newspaper.delete_all
Subscription.delete_all

puts 'Creating districts...'
District.create([
  {name: "15016"},
  {name: "14022"},
  {name: "14019"}
])

puts 'Creating customers...'
Customer.create([
  {name: "Herr Brown", address: "Balsaminenstr. 16", delivery_note: "BK1", district_id: District.first.id},
  {name: "Herr Black", address: "Lerchenauerstr. 205", delivery_note: "BK2", district_id: District.first.id},
  {name: "Frau Pink", address: "Ratoldstr. 18", delivery_note: "BK 5/1", district_id: District.second.id},
  {name: "Herr Green", address: "Weitlstr. 147", delivery_note: "BK 3/2", district_id: District.second.id},
  {name: "Herr Red", address: "Ratoldstr. 72", delivery_note: "RO", district_id: District.last.id},
  {name: "Frau Violet", address: "Rambertweg 15", delivery_note: "RO", district_id: District.last.id}
])

puts 'Creating newspapers...'
Newspaper.create([
  {name: "SZ", full_name: 'Süddeutsche Zeitung'},
  {name: "MM", full_name: 'Münchner Merkur'},
  {name: "TZ", full_name: 'Tz'},
  {name: "AZ", full_name: 'Abendzeitung'},
  {name: "Bild", full_name: 'Bild'},
  {name: "Zeit", full_name: 'Die Zeit'}
])

puts 'Creating subscriptions...'
Subscription.create([
  {is_active: true, is_monday: true, is_tuesday: true, is_wednesday: true, is_thursday: true, is_friday: true, is_saturday: true, order_index: 1, newspaper_id: Newspaper.first.id, customer_id: Customer.first.id},
  {is_active: true, is_monday: false, is_tuesday: false, is_wednesday: false, is_thursday: true, is_friday: false, is_saturday: false, order_index: 2, newspaper_id: Newspaper.last.id, customer_id: Customer.first.id},
  {is_active: true, is_monday: true, is_tuesday: true, is_wednesday: true, is_thursday: true, is_friday: true, is_saturday: true, order_index: 3, newspaper_id: Newspaper.second.id, customer_id: Customer.second.id},
  {is_active: true, is_monday: true, is_tuesday: true, is_wednesday: true, is_thursday: true, is_friday: true, is_saturday: true, order_index: 4, newspaper_id: Newspaper.third.id, customer_id: Customer.third.id},
  {is_active: true, is_monday: false, is_tuesday: false, is_wednesday: false, is_thursday: false, is_friday: true, is_saturday: true, order_index: 5, newspaper_id: Newspaper.fourth.id, customer_id: Customer.fourth.id},
  {is_active: true, is_monday: true, is_tuesday: true, is_wednesday: true, is_thursday: true, is_friday: true, is_saturday: true, order_index: 6, newspaper_id: Newspaper.fifth.id, customer_id: Customer.fifth.id},
  {is_active: true, is_monday: false, is_tuesday: false, is_wednesday: false, is_thursday: false, is_friday: true, is_saturday: true, order_index: 7, newspaper_id: Newspaper.first.id, customer_id: Customer.last.id},
  {is_active: false, is_monday: true, is_tuesday: true, is_wednesday: true, is_thursday: true, is_friday: true, is_saturday: true, order_index: 8, newspaper_id: Newspaper.second.id, customer_id: Customer.last.id}
])

puts 'Finished!'