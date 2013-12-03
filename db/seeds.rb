# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Materiale.delete_all
100.times do |i|
  Materiale.create(:onyx_p_n=>"materiale#{i}", :type=>"cpu", :description=>"test", :p_n=>"123", :substitute_code=>"123", :substitute_p_n=>"123",
                   :footprint=>"123", :mark=>"123", :level=>"123", :remark=>"123", :manufacture=>"123", :quantity=>"122", :lower_limit=>"0")
end
