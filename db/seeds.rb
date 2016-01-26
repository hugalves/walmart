# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

# A B 10
# B D 15
# A C 20
# C D 30
# B E 50
# D E 30

City.create(name: 'São Paulo')
CityMap.create(city_id: City.first.id, origin: 'A', destiny: 'B', distance: 10)
CityMap.create(city_id: City.first.id, origin: 'B', destiny: 'D', distance: 15)
CityMap.create(city_id: City.first.id, origin: 'A', destiny: 'C', distance: 20)
CityMap.create(city_id: City.first.id, origin: 'C', destiny: 'D', distance: 30)
CityMap.create(city_id: City.first.id, origin: 'B', destiny: 'E', distance: 50)
CityMap.create(city_id: City.first.id, origin: 'D', destiny: 'E', distance: 30)
