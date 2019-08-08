defmodule HobbitTest do
  use ExUnit.Case
  doctest Hobbit
  import Hobbit


  test 'it has a name' do
    hobbit = %Hobbit{name: 'Bilbo'}

    assert hobbit.name == 'Bilbo'
  end

  @tag :skip
  test 'it has a different name' do
    hobbit = %Hobbit{name: 'Frodo'}

    assert hobbit.name == 'Frodo'
  end

  @tag :skip
  test 'disposition is unadventurous' do
    hobbit = %Hobbit{name: 'Samwise'}

    assert hobbit.disposition == 'homebody'
  end

  @tag :skip
  test 'disposition is unadventurous' do
    hobbit = %Hobbit{name: 'Frodo', disposition: 'adventurous'}

    assert hobbit.disposition == 'adventurous'
  end

  @tag :skip
  test 'grows older when celebrating birthday' do
    hobbit = %Hobbit{name: 'Meriadoc'}
    assert hobbit.age == 0
    hobbit.celebrate_birthday
    hobbit.celebrate_birthday
    hobbit.celebrate_birthday
    hobbit.celebrate_birthday
    hobbit.celebrate_birthday

    assert hobbit.age == 5
  end

  @tag :skip
  test 'grows older when celebrating birthday' do
    hobbit = %Hobbit{name: 'Meriadoc'}

    assert hobbit.age == 0

    (1 .. 5) |> Enum.each(hobbit.celebrate_birthday)

    assert hobbit.age == 5
  end

  @tag :skip
  test 'is considered a child at 32' do
    hobbit = %Hobbit{name: 'Meriadoc'}

    assert hobbit.age == 0

    (1 .. 32) |> Enum.each(hobbit.celebrate_birthday)

    assert hobbit.age == 32
    refute hobbit.adult?
  end

  @tag :skip
  test 'is considered an adult at 33' do
    hobbit = %Hobbit{name: 'Meriadoc'}

    assert hobbit.age == 0

    (1 .. 33) |> Enum.each(hobbit.celebrate_birthday)

    assert hobbit.age == 33
    assert hobbit.adult?
  end

  @tag :skip
  test 'is considered an adult at 33' do
    hobbit = %Hobbit{name: 'Meriadoc'}

    assert hobbit.age == 0

    (1 .. 33) |> Enum.each(hobbit.celebrate_birthday)

    assert hobbit.age == 33
    assert hobbit.adult?

    # still adult, one year later
    hobbit.celebrate_birthday

    assert hobbit.age == 34
    assert hobbit.adult?
  end

  @tag :skip
  test 'is old at the age of 101' do
    hobbit = %Hobbit{name: 'Meriadoc'}

    assert hobbit.age == 0

    (1 .. 101) |> Enum.each(hobbit.celebrate_birthday)

    assert hobbit.age == 101
    assert hobbit.old?
  end

  @tag :skip
  test 'hobbit has the ring if name is Fordo' do
    frodo = %Hobbit{name: 'Frodo'}
    sam = %Hobbit{name: 'Samwise'}

    assert frodo.has_ring?
    refute sam.has_ring?
  end

  @tag :skip
  test 'hobbit is short' do
    frodo = %Hobbit{name: 'Frodo'}

    assert frodo.is_short?
  end
end
