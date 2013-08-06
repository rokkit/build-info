# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'


Role.delete_all
['admin','common_seller','common_buyer','agency_owner','super_user'].each do |role|
  Role.create!(name: role)
end

User.delete_all
  u=User.create!(:email => 'admin@example.com', :password => 'password', fio: "admin", phone:'79523707281')
  u.approve!
  u.roles << Role.find_by_name("admin")
  u.save!



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
%w(Avito).each do |t|
  TypeOfLinkedAccount.create name: t
end


