# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
jim = Teacher.create(first_name: 'Jim', last_name: 'Lindsay', room: 'A231 and D104')
lawrence = Teacher.create(first_name: 'Lawrence', last_name: 'Pang', room: 'D103')

TeacherNeed.create(description: "10 pencils", teacher: jim)