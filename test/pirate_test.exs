defmodule PirateTest do
  use ExUnit.Case
  doctest Pirate
  import Pirate

  test 'it has a name' do
    pirate = %Pirate{name: 'Jack'}

    assert pirate.name == 'Jack'
  end

  test 'it has a different name' do
    pirate = %Pirate{name: 'Blackbeard'}

    assert pirate.name == 'Blackbeard'
  end

  test 'it is a scallywag by default' do
    pirate = %Pirate{name: 'Jack'}

    assert pirate.job == 'Scallywag'
  end

  test 'it is not always a scallywag' do
    pirate = %Pirate{name: 'Jack', job: 'Cook'}

    assert pirate.job == 'Cook'
  end

  test 'it isnt cursed by default' do
    pirate = %Pirate{name: 'Jack'}

    refute pirate.cursed?
  end

  test 'it becomes cursed after enough heinous acts' do
    pirate = %Pirate{name: 'Jack'}

    refute pirate.cursed?

    pirate.commit_heinous_act
    refute pirate.cursed?

    pirate.commit_heinous_act
    refute pirate.cursed?

    pirate.commit_heinous_act
    assert pirate.cursed?
  end

  test 'a pirate has booty' do
    # create a pirate
    # check that the pirate starts with 0 booty
  end

  test 'a pirate gets 100 booty for robbing ships' do
    # create a pirate
    # rob some ships
    # check that the pirate got 100 booty for each ship it robbed
  end
end
