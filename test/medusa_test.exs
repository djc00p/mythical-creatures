defmodule MedusaTest do
  use ExUnit.Case
  doctest Medusa
  import Medusa
  import Person


  test 'it has a name' do
    medusa = %Medusa{name: 'Cassiopeia'}

    assert medusa.name == 'Cassiopeia'
  end

  @tag :skip
  test 'when first created she has no statues' do
    medusa = %Medusa{name: 'Cassiopeia'}

    assert medusa.statues.empty?
  end

  @tag :skip
  test 'when staring at a person she gains a statue' do
    medusa = %Medusa{name: 'Cassiopeia'}
    victum = %Person{name: 'Perseus'}

    medusa.stare(victum)

    assert medusa.statues.count == 1
    assert medusa.statues.first.name == 'Perseus'
  end

  @tag :skip
  test 'when staring at a person that person turns to stone' do
    medusa = %Medusa{name: 'Cassiopeia'}
    victum = %Person{name: 'Perseus'}

    refute victim.stoned?

    medusa.stare(victum)

    assert victum.stoned?
  end

  @tag :skip
  test 'can only have three victims' do
    medusa = %Medusa{name: 'Cassiopeia'}
    victum1 = %Person{name: 'Perseus'}
    victum2 = %Person{name: 'Cratos'}
    victum3 = %Person{name: 'Pegasus'}
    victum4 = %Person{name: 'Chrysaor'}

    medusa.stare(victim1)
    medusa.stare(victim2)
    medusa.stare(victim3)

    assert medusa.statues.count == 3

    medusa.stare(victim4)

    assert medusa.statues.count == 3
  end

  @tag :skip
  test 'if a fourth victim is stoned first is unstoned' do
    medusa = %Medusa{name: 'Cassiopeia'}
    victum1 = %Person{name: 'Perseus'}
    victum2 = %Person{name: 'Cratos'}
    victum3 = %Person{name: 'Pegasus'}
    victum4 = %Person{name: 'Chrysaor'}

    medusa.stare(victim1)
    medusa.stare(victim2)
    medusa.stare(victim3)

    assert medusa.statues.count == 3
    assert victum1.stoned?
    assert victum2.stoned?
    assert victum3.stoned?
    medusa.stare(victim4)

    assert medusa.statues.count == 3
    assert victum4.stoned?
    refute victum1.stoned?
  end
end
