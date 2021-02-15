# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mountain.destroy_all
User.destroy_all
Hike.destroy_all

sally = User.create(username: "Sally", admin: true, password: "sally", email: "sally@sally.com")
fred = User.create(username: "Fred", password: "fred", email: "fred@fred.com")


quandry = Mountain.create(name: "Quandry Peak", base_elevation: 11006, summit_elevation: 14270, city: "Breckenridge", state: "CO", directions_url: "https://goo.gl/maps/ACG5JVspvhkCykdz7", hike_distance: 7)
baldy = Mountain.create(name: "Baldy", base_elevation: 10000, summit_elevation: 12890, city: "Breckenridge" , state: "CO", directions_url: "https://goo.gl/maps/Etsrxp2Dj17WXTkcA", hike_distance: 5)
peak1 = Mountain.create(name: "Peak One", base_elevation: 8900, summit_elevation: 13400, city: "Frisco", state: "CO", directions_url: "https://goo.gl/maps/5qN9R3okHiou4VYu7", hike_distance: 6)
buck = Mountain.create(name: "Buck", base_elevation: 0, summit_elevation: 300, city: "Burnsville", state: "MN", directions_url: "https://goo.gl/maps/HGCn2DadLZzACvgLA", hike_distance: 6)

Hike.create(user_id: sally.id, mountain_id: quandry.id, rating: 4, comment: "My knees hurt", date_hiked: "2016-05-20", percent_hiked: 100, hiked: true)
Hike.create(user_id: sally.id, mountain_id: baldy.id, rating: 5, comment: "So fun will do it again", date_hiked: "2014-04-20", percent_hiked: 100, hiked: true)
Hike.create(user_id: sally.id, mountain_id: baldy.id, rating: 3, comment: "So busy, the secret is out", date_hiked: "2018-09-20", percent_hiked: 75, hiked: true)
Hike.create(user_id: fred.id, mountain_id: quandry.id, rating: 2, comment: "Oxygen is way too thin", date_hiked: "2012-07-20", percent_hiked: 75, hiked: true)
Hike.create(user_id: fred.id, mountain_id: buck.id, rating: 5, comment: "Took me 20 minutest to hike", date_hiked: "2006-08-20", percent_hiked: 75, hiked: true)
Hike.create(user_id: fred.id, mountain_id: baldy.id, hiked: false)
Hike.create(user_id: fred.id, mountain_id: peak1.id, hiked: false)