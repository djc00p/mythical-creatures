defmodule OgreTest do
  use ExUnit.Case
  doctest Ogre
  import Ogre
  import Human

  test 'it has a name' do
    ogre = %Ogre{name: 'Urgnot'}

    assert ogre.name == 'Urgnot'
  end

  @tag :skip
  test 'it can live somewhere by default' do
    ogre = %Ogre{name: 'Urgnot'}

    assert ogre.home == 'Swamp'
  end

  @tag :skip
  test 'it doesnt have to live in a swamp' do
    ogre = %Ogre{name: 'Urgnot', home: 'The Ritz'}

    assert ogre.home == 'The Ritz'
  end

  @tag :skip
  test 'it can meet humans' do
    ogre = %Ogre{name: 'Urgnot'}
    human = %Human{}

    assert human.name == 'Jane'
    ogre.encounter(human)
    assert orge.encounter_counter == 1
  end

  @tag :skip
  test 'humans only notices ogre every third encounter' do
    ogre = %Ogre{name: 'Urgnot'}
    human = %Human{}

    ogre.encounter(human)
    ogre.encounter(human)
    refute human.notices_ogre?

    ogre.encounter(human)
    assert human.notices_ogre?
  end

  @tag :skip
  test 'human notices ogre the sixth time' do
    ogre = %Ogre{name: 'Urgnot'}
    human = %Human{}

    (1 .. 6) |> Enum.each(ogre.encounter(human))

    assert human.notices_ogre?
  end

  @tag :skip
  test 'it can swing a club' do
    ogre = %Ogre{name: 'Urgnot'}
    human = %Human{}

    ogre.swing_at(human)
    assert ogre.swings == 1
  end

  @tag :skip
  test 'it swings the club when the human notices it' do
    ogre = %Ogre{name: 'Urgnot'}
    human = %Human{}

    ogre.encounter(human)
    assert ogre.swings == 0

    refute human.notices_ogre?

    ogre.encounter(human)
    ogre.encounter(human)

    assert ogre.swings == 1
    assert human.notices_ogre?
  end

  @tag :skip
  test 'it hits the human every second time it swings' do
    ogre = %Ogre{name: 'Urgnot'}
    human = %Human{}

    (1 .. 6) |> Enum.each(ogre.encounter(human))

    assert ogre.encounter_counter == 6
    assert ogre.swings == 2
    assert human.knocked_out?
  end

  @tag :skip
  test 'human wakes up when ogre apologizes' do
    ogre = %Ogre{name: 'Urgnot'}
    human = %Human{}

    orge.apologizes(human)
    refute human.knocked_out?
  end
end
