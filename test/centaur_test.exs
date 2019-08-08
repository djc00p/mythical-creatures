defmodule CentaurTest do
  use ExUnit.Case
  doctest Centaur
  import Centaur


  test 'it has a name' do
    centaur = %Centaur{name: 'George'}

    assert centaur.name == 'George'
  end

  @tag :skip
  test 'it has a horse breed' do
    centaur = %Centaur{name: 'George', breed: 'Palomino'}

    assert centaur.name == 'George'
    assert centaur.breed == 'Palomino'
  end

  @tag :skip
  test 'it has excellent bow skills' do

    assert Centaur.shoot == 'Twang!!!'
  end

  @tag :skip
  test 'it makes a horse sound when it runs' do

    assert Centaur.run == 'Clop clop clop clop!!!'
  end

  @tag :skip
  test 'when firt initialized it is not cranky' do

    refute Centaur.cranky?
  end

  @tag :skip
  test 'when firt initialized it is standing' do

    assert Centaur.standing?
  end

  @tag :skip
  test 'after running or shooting a bow three times it gets cranky' do
    # centaur = %Centaur{name: 'George'}
    
    Centaur.run
    Centaur.shoot
    Centaur.run

    assert Centaur.cranky?
  end

  @tag :skip
  test 'when cranky it will not shoot' do
    # centaur = %Centaur{name: 'George'}
    (1 .. 3) |> Enum.each(Centaur.shoot)

    assert Centaur.shoot == "NO!"
  end

  @tag :skip
  test 'when cranky it will not run' do
    # centaur = %Centaur{name: 'George'}
    (1 .. 3) |> Enum.each(Centaur.run)

    assert Centaur.run == "NO!"
  end

  @tag :skip
  test 'when standing it will not sleep' do
    # centaur = %Centaur{name: 'George'}

    assert Centaur.sleep == "NO!"
  end

  @tag :skip
  test 'after laying down it is not standing' do
    # centaur = %Centaur{name: 'George'}

    refute Centaur.standing?
    assert Centaur.laying?
  end

  @tag :skip
  test 'it can sleep when laying down' do
    # centaur = %Centaur{name: 'George'}
    Centaur.lay_down
    refute Centaur.sleep == "NO!"
  end

  @tag :skip
  test 'when laying down it cannot shoot bow' do
    # centaur = %Centaur{name: 'George'}
    Centaur.lay_down
    assert Centaur.shoot == "NO!"
  end

  @tag :skip
  test 'when laying down it cannot run' do
    # centaur = %Centaur{name: 'George'}
    Centaur.lay_down
    assert Centaur.run == "NO!"
  end

  @tag :skip
  test 'it cant stand up' do
    # centaur = %Centaur{name: 'George'}
    Centaur.lay_down
    Centaur.stand_up
    assert Centaur.standing?
  end

  @tag :skip
  test 'after sleeping it is no longer cranky' do
    # centaur = %Centaur{name: 'George'}
    Centaur.shoot
    Centaur.run
    Centaur.shoot

    assert Centaur.cranky?

    Centaur.lay_down
    Centaur.sleep

    refute Centaur.cranky?

    Centaur.stand_up

    assert Centaur.shoot == 'Twang!!!'
    assert Centaur.run == 'Clop clop clop clop!!!'
  end

  @tag :skip
  test "it becomes rested after drinking a potion" do
    # centaur = %Centaur{name: 'George'}
    Centaur.shoot
  end

  @tag :skip
  test "it can only drink potion while standing" do
    # centaur = %Centaur{name: 'George'}
    Centaur.shoot
  end

  @tag :skip
  test "it gets sick if it drinks potion while rested" do
    # centaur = %Centaur{name: 'George'}
    Centaur.shoot
  end
end
