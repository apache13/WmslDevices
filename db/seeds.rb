# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Staff.create(name: 'Alice', code: 'S-00001', department: 'DEV')
Staff.create(name: 'John', code: 'S-00002', department: 'QA')
Staff.create(name: 'Sara', code: 'S-00003', department: 'BA')
Staff.create(name: 'Peter', code: 'S-00004', department: 'MK')
Staff.create(name: 'Jame', code: 'S-00005', department: 'SE')


Device.create(name: 'MON-LG-19.5"-20MP48A-P',code: 'MON-00001')
Device.create(name: 'MON-LG-18.5"-19M38A-B',code: 'MON-00002')
Device.create(name: 'MON-SAMSUNG-18.5"-LS19F350NHEXXT',code: 'MON-00003')
Device.create(name: 'MON-ASUS-18.5"-VS197DE',code: 'MON-00004')

Device.create(name: 'HDD-SEAGATE-1.0TB-ST1000DM010',code: 'HDD-00001')
Device.create(name: 'HDD-SEAGATE-1.0TB-ST1000VX005',code: 'HDD-00002')
Device.create(name: 'HDD-WD-1.0TB-WD1003FZEX',code: 'HDD-00003')

Device.create(name: 'KEY-LOGITECH-K400PLUS',code: 'KEY-00001')

Device.create(name: 'MOU-ANITECH-W213-WH',code: 'MOU-00001')
Device.create(name: 'MOU-LOGITECH-G403W',code: 'MOU-00002')
