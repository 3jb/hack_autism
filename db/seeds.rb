# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "Populating States."
State.delete_all
File.open('stateseed.txt').each_line do |line|
	l = line.split(';')
	puts l
	s = State.create(:s_id=>l[0].to_i,:name=>l[1].tr('"', ''),:toonsay=>l[2].tr('"', ''),:best_resp=>l[3].to_i,:good_resp=>l[4].to_i,:bad_resp=>l[5].to_i,:worst_resp=>l[6].to_i)
	s.save
	puts s.s_id
end

puts "Populating Responses."
Response.delete_all
File.open('responseseed.txt').each_line do |line|
	l = line.split(';')
	puts l
	r = Response.create(:r_id=>l[0].to_i,:quality=>l[1],:sayit=>l[2].tr('"', '').squish,:next_state=>l[3].to_i,:current_state=>l[4].to_i,:next_say=>l[5].tr('"', '').squish)
	r.save
	puts r.r_id
end

puts "Populating Oracles."
Oracle.delete_all
File.open('oracleseed.txt').each_line do |line|
	l = line.split(';')
	puts l
	o = Oracle.create(:resp_id=>l[1].to_i,:advice=>l[2].tr('"', '').squish)
	o.save
	puts o.id
end

