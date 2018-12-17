require_relative('../models/animal')
require_relative('../models/owner')

require('pry')


Animal.delete_all
Owner.delete_all


owner1 = Owner.new({'name' => 'Frankenstein Dracula'})
owner1.save

owner2 = Owner.new({'name' => 'Count Von Finklestein'})
owner2.save

owner3 = Owner.new({'name' => 'Jim Jones'})
owner3.save

owner4 = Owner.new({'name' => 'Tommy Bones'})
owner4.save

animal1 = Animal.new({'animal_name' => 'Raisin', 'type' => 'cat', 'admission_date' => 'January', 'available' => 'no', 'owner_id' => owner1.id})
animal1.save

animal2 = Animal.new({'animal_name' => 'Mr. Bananas', 'type' => 'exotic', 'admission_date' => 'February', 'available' => 'yes', 'owner_id' => nil})
animal2.save

animal3 = Animal.new({'animal_name' => 'Brandon', 'type' => 'fish', 'admission_date' => 'March', 'available' => 'no', 'owner_id' => owner2.id})
animal3.save

animal4 = Animal.new({'animal_name' => 'Meatball', 'type' => 'cat', 'admission_date' => '2011', 'available' => 'yes', 'owner_id' => nil})
animal4.save

animal5 = Animal.new({'animal_name' => 'Milhouse', 'type' => 'exotic', 'admission_date' => 'May', 'available' => 'no', 'owner_id' => owner1.id})
animal5.save

animal6 = Animal.new({'animal_name' => 'Franklin', 'type' => 'dog', 'admission_date' => 'June', 'available' => 'no', 'owner_id' => owner1.id})
animal6.save

binding.pry
nil
