# encoding: UTF-8
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
['Российская Федерация',"Украина", "Финляндия"].each do |countries|
    Country.create!(:name => countries)
end

Region.delete_all
  c = Country.find_by_name("Российская Федерация")
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


