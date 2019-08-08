defmodule DragonTest do
  use ExUnit.Case
  doctest Dragon
  import Dragon


  test 'it has a name' do
    dragon = %Dragon{name: 'Draco'}

    assert dragon.name == 'Draco'
  end

  @tag :skip
  test 'it has a rider' do
    dragon = %Dragon{name: 'Draco', rider: 'Lessa'}

    assert dragon.rider == 'Lessa'
  end

  @tag :skip
  test 'it has a rider' do
    dragon = %Dragon{name: 'Draco', rider: 'Lessa'}

    assert dragon.rider == 'Lessa'
  end

  @tag :skip
  test 'it has a color' do
    dragon = %Dragon{name: 'Draco', rider: 'Lessa', color: :gold}

    assert dragon.color == :gold
  end

  @tag :skip
  test 'it has a color' do
    dragon = %Dragon{name: 'Draco', color: :gold, rider: 'Lessa'}

    assert dragon.color == :gold
  end

  @tag :skip
  test 'a different dragon, color and rider' do
    dragon = %Dragon{name: 'Mnementh', color: :silver, rider: 'Lessa'}

    assert dragon.name == 'Mnementh'
    assert dragon.color == :silver
    assert dragon.rider == 'Lessa'
  end

  @tag :skip
  test 'if dragons are born hungry' do
    dragon = %Dragon{name: 'Mnementh', color: :silver, rider: 'Lessa'}

    assert Dragon.hungry?
  end

  @tag :skip
  test 'dragons eat alot' do
    dragon = %Dragon{name: 'Mnementh', color: :silver, rider: 'Lessa'}
    
    assert Dragon.hungry?
    dragon.eat
    assert Dragon.hungry?
    dragon.eat
    assert Dragon.hungry?
    dragon.eat
    assert Dragon.hungry?
  end
end
