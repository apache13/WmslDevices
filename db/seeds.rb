# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Staff.create(name: 'John', code: 'S-00001', department: 'DEV')
Staff.create(name: 'Sara', code: 'S-00002', department: 'QA')


Device.create(name: 'Monitor-LG',code: 'M-00001')
Device.create(name: 'Monitor-SAMSUNG',code: 'M-00002')
Device.create(name: 'HDD-SEAGATE',code: 'H-00001')
Device.create(name: 'HDD-WESTERN',code: 'H-00002')
Device.create(name: 'Mouse-Logitech',code: 'K-00001')
Device.create(name: 'Mouse-Logitech',code: 'K-00002')

