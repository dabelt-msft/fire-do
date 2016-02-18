$list = []

class ActionItems
  @@totalHours = 0.0

  attr_accessor :realPriority

  def initialize task, time, nominalPriority
    #Instance Variables
    @task = task #task to be completed
    @time = time #time to complete
    @nominalPriority = nominalPriority #nominal priority of the item

    ##Class Variables
    @@totalHours += time
  end

  def updateProportion
    @proportion = @time / @@totalHours
  end

  def updateInverse
    @inverse = 1 - @proportion
  end

  def updateRealPriority
    @realPriority = @inverse * @nominalPriority
  end

end


def updateItems
  i = 0
  while i < $list.length
    $list[i].updateProportion
    $list[i].updateInverse
    $list[i].updateRealPriority
    puts "Real Priority for item #{i+1} is #{$list[i].realPriority}"
    i += 1
  end
end


$list << ActionItems.new("wash car", 0.5, 1)
$list << ActionItems.new("Set up meetings for Nas", 1, 10)
$list << ActionItems.new("Add newly created app to Ruby on rails", 0.5, 10)


updateItems

##These work but there's just got to be a better way to do this.
# $list[0].updateProportion
# $list[1].updateProportion

# $list[1].updateProportion
# $list[1].setInverse
# $list[1].setRealPriorty


=begin
FULLMOON = true

def Creature
  def initialize (aSpeech)
    @speech = aSpeech
  end

  def talk
    puts (@speech)
  end
end

cat = Creature.new("meow")
dog = Creature.new("ruff")
manwolf = Creature.new("hey man; what's up!")
werewolf = Creature.new("Growl")

def werewolf.howl
  if FULLMOON then
    puts "howwwwl"
  else
    talk
  end
end

werewolf.howl


#iterators
#
#
#

#for in do
for i in [1,2,3] do
 puts( i )
end

#.each
[1,2,3].each do |i|
 puts( i )
end


h1 = {'key1'=>'val1', 'key2'=>'val2', 'key3'=>'val3', 'key4'=>'val4'}
h2 = {'key1'=>'val1', 'KEY_TWO'=>'val2', 'key3'=>'VALUE_3',
'key4'=>'val4'}

p h1.keys
p h1.keys << h2.keys
p h1.keys << "key"

p h1.keys & h2.keys  #shows what's in common
p h1.keys + h2.keys  #adding things together

dictionary = {
  "name" => "david",
  "friends" => {
    "names" => ["Fred", "James"],
    "age" => 20
  }
}



h2 = Hash.new("Some kind of ring")
h2["something else"] = "test"

p h2

puts dictionary["friends"]["names"][0]

list = [1,2,3,4]

mapped = list.map { |item| item * 5 }

puts mapped

class Animal
  @@num_animals = 0 #class variable

  def initialize ( name, age, assert_mammal )
    @name   = name
    @age    = age
    @mammal = assert_mammal
    @@num_animals += 1
  end

  def speak weather
    puts "The weather is #{weather} today"
  end

  def show_classvars
    puts "There are #{@@num_animals} animals"
  end

end


class Dog < Animal

  def initialize ( name, age, assert_mammal, hLength )
    super name, age, assert_mammal
    @hairLength = hLength
  end

  def speak weather
    super
  end

end

dog1 = Dog.new("Barksalottamus", 3, true, "short")
animal = Animal.new("bird", 4, false)
puts animal.show_classvars
dog2 = Dog.new("sparky", 2, true, "long")


puts Animal.inspect
puts animal.show_classvars

=end
