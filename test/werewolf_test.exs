defmodule WerewolfTest do
  use ExUnit.Case
  doctest Werewolf
  import Werewolf

  test 'test it has a name' do
    werewolf = %Werewolf{name: "David"}
    
    assert werewolf.name == "David"
  end

  @tag :skip
  test 'test it has a location' do
    werewolf = %Werewolf{name: "David", location: "London"}
    
    assert werewolf.location == "David"
  end

  @tag :skip
  test 'test it is by default in human form' do
    werewolf = %Werewolf{name: "David", location: "London"}
    
    assert werewolf.human?
  end

  @tag :skip
  test 'test when starting as a human changing means it is no longer human' do
    werewolf = %Werewolf{name: "David", location: "London"}
    
    werewolf.change!
    refute werewolf.human?
  end

  @tag :skip
  test 'test when starting as a human changing turns it into a werewolf' do
    werewolf = %Werewolf{name: "David", location: "London"}
    
    werewolf.change!
    assert werewolf.wolf?
  end

  @tag :skip
  test 'test when starting as a human changing a second time it becomes human again' do
    werewolf = %Werewolf{name: "David", location: "London"}
    
    assert werewolf.human?
    werewolf.change!
    werewolf.change!
    assert werewolf.human?
  end

  @tag :skip
  test 'test when starting as a werewolf changing a second time it becomes werewolf again' do
    werewolf = %Werewolf{name: "David", location: "London"}
    
    werewolf.change!
    assert werewolf.wolf?
    werewolf.change!
    werewolf.change!
    assert werewolf.wolf?
  end

  @tag :skip
  test 'test is not hungry by default' do
    # your code here
  end

  @tag :skip
  test 'test becomes hungry after changing to a werewolf' do
    # your code here
  end


  defmodule Victim

    defstruct [status: :alive]
  end


  @tag :skip
  test 'test consumes a victim' do
    # your code here
  end

  @tag :skip
  test 'test cannot consume victim if in human form' do
    # your code here
  end

  @tag :skip
  test 'test a werewolf who has consumed a victim is no longer hungry' do
    # your code here
  end

  @tag :skip
  test 'test a werewolf who has consumed a victim makes the victim dead' do
    # your code here
  end
end
