defmodule UnicornTest do
  use ExUnit.Case
  doctest Unicorn
  import Unicorn

  test 'it has a name' do
    unicorn = %Unicorn{name: 'Robert'}

    assert unicorn.name == 'Robert'
  end

  @tag :skip
  test 'it is white by default' do
    unicorn = %Unicorn{name: 'Margaret'}

    assert unicorn.color == 'White'
    assert unicorn.white?
  end

  @tag :skip
  test 'it does not have to be white' do
    unicorn = %Unicorn{name: 'Barbara', color: 'purple'}

    assert unicorn.color == 'purple'
    refute unicorn.white?
  end

  @tag :skip
  test 'unicorn says sparkly stuff' do
    unicorn = %Unicorn{name: 'Johnny'}

    assert unicorn.say("Wonderful!") == '**;* Wonderful! **;*'
    assert unicorn.say("I don't like you very much.") == "**;* I don't like you very much. **;*"
  end
end
