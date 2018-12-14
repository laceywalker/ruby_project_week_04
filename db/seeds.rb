require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/adoption')
require('pry')

Adoption.delete_all
Animal.delete_all
Owner.delete_all


owner1 = Owner.new({'name' => 'Frankenstein Dracula'})
owner1.save

owner2 = Owner.new({'name' => 'Count Von Finklestein'})
owner2.save

owner3 = Owner.new({'name' => 'Jim Jones'})
owner3.save


animal1 = Animal.new({'name' => 'Raisin', 'type' => 'cat', 'date' => 'January', 'available' => 'true', 'owner_id' => owner1.id})
animal1.save

animal2 = Animal.new({'name' => 'Mr. Bananas', 'type' => 'potbelly pig', 'date' => 'February', 'available' => 'false', 'owner_id' => owner2.id})
animal2.save

animal3 = Animal.new({'name' => 'Brandon', 'type' => 'fish', 'date' => 'March', 'available' => 'true', 'owner_id' => owner2.id})
animal3.save

adoption1 = Adoption.new({'date_adopted' => 'January', 'owner_id' => owner1.id, 'animal_id' => animal1.id})
adoption1.save

adoption2 = Adoption.new({'date_adopted' => 'October 10, 2018', 'animal_id' => animal3.id, 'owner_id' => owner2.id})
adoption2.save


binding.pry
nil
