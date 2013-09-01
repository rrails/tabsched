# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Medicationtype.destroy_all
Frequencytype.destroy_all
Timeperiodname.destroy_all

freq1 = Frequencytype.create(:frequency_type => 'Daily')
freq2 = Frequencytype.create(:frequency_type => 'Weekly')
freq3 = Frequencytype.create(:frequency_type => 'Monthly')

medtype1 = Medicationtype.create(:medication_type => 'Tablet')
medtype2 = Medicationtype.create(:medication_type => 'Liquid')
medtype3 = Medicationtype.create(:medication_type => 'Injection')

medtype1 = Timeperiodname.create(:time_period_name => 'Before Breakfast')
medtype2 = Timeperiodname.create(:time_period_name => 'Breakfast')
medtype3 = Timeperiodname.create(:time_period_name => 'After Breakfast')