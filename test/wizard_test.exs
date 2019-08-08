defmodule WizardTest do
  use ExUnit.Case
  doctest Wizard
  import Wizard

  test 'test has name' do
    wizard = %Wizard{name: "Eric"}

    assert wizard.name == "Eric"
  end

  @tag :skip
  test 'test can have different name' do
    wizard = %Wizard{name: "Alex"}

    assert wizard.name == "Alex"
  end

  @tag :skip
  test 'test is bearded by default' do
    wizard = %Wizard{name: "Ben"}

    assert wizard.bearded?
  end

  @tag :skip
  test 'test is not always bearded' do
    wizard = %Wizard{name: "Valerie", bearded: false}

    refute wizard.bearded?
  end

  @tag :skip
  test 'test has root powers' do
    wizard = %Wizard{name: "Sarah", bearded: false}

    assert wizard.incantation("chown ~/bin") == "sudo chown ~/bin"
  end

  @tag :skip
  test 'test has lots of root powers' do
    wizard = %Wizard{name: "Rob", bearded: false}
    
    assert wizard.incantation("rm -rf /home/mirandax") == "sudo rm -rf /home/mirandax"
  end

  @tag :skip
  test 'test starts rested' do
    # create wizard
    # .rested? returns true
  end

  @tag :skip
  test 'test can cast spells' do
    # create wizard
    # .cast returns "MAGIC MISSILE!"
  end

  @tag :skip
  test 'test gets tired after casting three spells' do
    # create wizard
    # casts spell twice
    # check wizard is rested
    # casts spell
    # check wizard is not rested
  end
end
