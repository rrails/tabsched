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


medtype1 = Medicationtype.create(:medication_type => 'Tablets')
medtype1 = Medicationtype.create(:medication_type => 'Capsules')
medtype2 = Medicationtype.create(:medication_type => 'Liquid')
medtype3 = Medicationtype.create(:medication_type => 'Injection')

medtype1 = Timeperiodname.create(:time_period_name => 'Before Breakfast')
medtype2 = Timeperiodname.create(:time_period_name => 'Breakfast')
medtype3 = Timeperiodname.create(:time_period_name => 'After Breakfast')
medtype1 = Timeperiodname.create(:time_period_name => 'Before Lunch')
medtype2 = Timeperiodname.create(:time_period_name => 'Lunch')
medtype3 = Timeperiodname.create(:time_period_name => 'After Lunch')
medtype1 = Timeperiodname.create(:time_period_name => 'Before Dinner')
medtype2 = Timeperiodname.create(:time_period_name => 'Dinner')
medtype3 = Timeperiodname.create(:time_period_name => 'After Dinner')
medtype3 = Timeperiodname.create(:time_period_name => 'Specific Time')