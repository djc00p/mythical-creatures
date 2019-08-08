defmodule VampireTest do
  use ExUnit.Case
  doctest Vampire
  import Vampire

  test 'test it has a name' do
    vampire = %Vampire{name: "Dracula"}
    assert vampire.name == "Dracula"
  end

  @tag :skip
  test 'test it is named something else' do
    vampire = %Vampire{name: "Vladimir"}
    assert vampire.name == "Vladimir"
  end

  @tag :skip
  test 'test it keeps a pet bat by default' do
    vampire = %Vampire{name: "Ruthven"}
    assert vampire.pet == "bat"
  end

  @tag :skip
  test 'test it can have other pets' do
    vampire = %Vampire{name: "Varney", pet: "fox"}
    assert vampire.pet == "fox"
  end

  @tag :skip
  test 'test it is thirsty by default' do
    vampire = %Vampire{name: "Count von Count"}
    assert vampire.thirsty?
  end

  @tag :skip
  test 'test it is not thirsty after drinking' do
    vampire = %Vampire{name: "Elizabeth Bathory"}
    vampire.drink
    refute vampire.thirsty?
  end
end
