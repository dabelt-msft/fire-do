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
