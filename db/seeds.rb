# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

User.delete_all
Role.delete_all
u=User.create!(:email => 'admin@mail.com', :password => 'password', :password_confirmation => 'password')
u.approve!
u.roles << Role.new(name:"admin")
u.save!

Country.delete_all
open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|
  countries.read.each_line do |country|
    code, name = country.chomp.split("|")
    Country.create!(:name => name)
  end
end

Region.delete_all
  c = Country.find_by_name("Russian Federation")
  ['Санкт-Петербург и Ленинградская область','Республика Карелия','Алтайский край', 'Краснодарский край'].each do |r|
    c.regions << Region.new(name: r)
  end
  c.save!
  
City.delete_all
t = Region.find_by_name('Санкт-Петербург и Ленинградская область')
['Санкт-Петербург', 'Кировск'].each do |c|
  t.cities << City.new(name: c)
end
t.save!
Distinct.delete_all
t = City.find_by_name('Санкт-Петербург')
['Кировский', 'Петроградский'].each do |c|
  t.distincts << Distinct.new(name: c)
end
t.save!

Street.delete_all
t = Distinct.find_by_name('Кировский')
['Проспект Ветеранов'].each do |c|
  t.streets << Street.new(name: c)
end
t.save!


#####BUILD OBEJCTS#####
TypeOfBuildObject.delete_all
['Квартира (Вторичный рынок)', "Комната (Вторичный рынок)", 'Квартира (Первичный рынок)','Комната (Вторичный рынок)'].each do |variable|
  TypeOfBuildObject.create! name: variable
end

TypeOfHouse.delete_all
%w(Сталинский Хрущевка Старый фонд Корабль Блочный Кирпичный).each do |t|
  TypeOfHouse.create! name: t
end
Material.delete_all
%w(Кирпичный Крупно-панел. Деревянный Блочный Монолитный).each do |t|
  Material.create! name: t
end

Address.delete_all
BuildObject.delete_all
a = Address.create!(country: Country.find_by_name("Russian Federation"),region:Region.find_by_name("Санкт-Петербург и Ленинградская область"),
city: City.find_by_name('Санкт-Петербург'), distinct: Distinct.find_by_name('Кировский'), street: Street.find_by_name("Проспект Ветеранов")
)
a.build_objects << BuildObject.new(type_of_build_object: TypeOfBuildObject.first, user: User.first, type_of_house: TypeOfHouse.first, material: Material.first,
price: 3000000, description: """Прямая продажа, 3 года собственности есть. Дом стоит во дворе, ТСЖ, чистые парадные, приличные соседи. Квартира двухсторонняя, стороны света:восток и запад.
Ремонт вполне качественный, есть некоторые недоделки. Встроенной кухни нет, место под кухню подготовлено, в том числе электропроводка. 89112558082""",
area: 77, living_area: 46, kitchen_area: 10.8, rooms:3
)
a.build_objects << BuildObject.new(type_of_build_object: TypeOfBuildObject.first, user: User.first, type_of_house: TypeOfHouse.first, material: Material.first,
price: 3000000, description: """Прямая продажа, 3 года собственности есть. Дом стоит во дворе, ТСЖ, чистые парадные, приличные соседи. Квартира двухсторонняя, стороны света:восток и запад.
Ремонт вполне качественный, есть некоторые недоделки. Встроенной кухни нет, место под кухню подготовлено, в том числе электропроводка. 89112558082""",
area: 77, living_area: 46, kitchen_area: 10.8, rooms:3
)
a.build_objects << BuildObject.new(type_of_build_object: TypeOfBuildObject.first, user: User.first, type_of_house: TypeOfHouse.first, material: Material.first,
price: 3000000, description: """Прямая продажа, 3 года собственности есть. Дом стоит во дворе, ТСЖ, чистые парадные, приличные соседи. Квартира двухсторонняя, стороны света:восток и запад.
Ремонт вполне качественный, есть некоторые недоделки. Встроенной кухни нет, место под кухню подготовлено, в том числе электропроводка. 89112558082""",
area: 77, living_area: 46, kitchen_area: 10.8, rooms:3
)
a.save!
