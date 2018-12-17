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

owner5 = Owner.new({'name' => 'Tony Pianofingers'})
owner5.save

owner6 = Owner.new({'name' => 'Cecil B. Carruthers'})
owner6.save

animal1 = Animal.new({'animal_name' => 'Raisin', 'type' => 'cat', 'admission_date' => 'January', 'available' => 'no', 'owner_id' => owner1.id, 'image' => 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201603/animals-story,-fb_647_031916013853.jpg'})
animal1.save

animal2 = Animal.new({'animal_name' => 'Mr. Bananas', 'type' => 'exotic', 'admission_date' => 'February', 'available' => 'yes', 'owner_id' => nil, 'image' => 'https://assets.rbl.ms/13597030/980x.jpg'})
animal2.save

animal3 = Animal.new({'animal_name' => 'Brandon', 'type' => 'fish', 'admission_date' => 'March', 'available' => 'no', 'owner_id' => owner2.id, 'image' => 'https://cdn.website.thryv.com/aaf02286134647018ed6791713cefded/dms3rep/multi/mobile/9141acb.jpg'})
animal3.save

animal4 = Animal.new({'animal_name' => 'Meatball', 'type' => 'cat', 'admission_date' => '2011', 'available' => 'yes', 'owner_id' => nil, 'image' => 'https://cdn.iflscience.com/images/30e2c454-15a3-5f2b-893d-3212f7b6bdf3/default-1464386511-624-why-your-cat-may-be-to-blame-for-your-anger-problems.jpg'})
animal4.save

animal5 = Animal.new({'animal_name' => 'Milhouse', 'type' => 'exotic', 'admission_date' => 'May', 'available' => 'no', 'owner_id' => owner1.id, 'image' => 'http://en.bcdn.biz/Images/2014/8/21/b7562cd1-c0ab-4c55-9632-50314fd65464.jpg'})
animal5.save

animal6 = Animal.new({'animal_name' => 'Franklin', 'type' => 'dog', 'admission_date' => 'June', 'available' => 'no', 'owner_id' => owner1.id, 'image' => 'https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg'})
animal6.save

binding.pry
nil
