# Mythical Creatures - Elixir

A collection of exercises to practice Elixir and TDD.

Mimicing the Turing
examples version of [Mythical
Creatures](https://github.com/turingschool/ruby-exercises/tree/master/mythical-creatures) for learning
Ruby

## How to Run

In order to complete these exercises create a module for each of the mythical creatures in the `test` directory.

Navigate to the `mythical-creatures` directory in your terminal, run `mix
deps.get` and then run your first test:

```
$ mix test test/unicorn_test.exs
```

That will likely produce an error saying that no `unicorn.ex` file exists.
The first line with `**` is the error message.

```
== Compilation error in file test/unicorn_test.exs ==
** (CompileError) test/unicorn_test.exs:3: module Unicorn is not loaded and could not be found
    (ex_unit) expanding macro: ExUnit.DocTest.doctest/1
    test/unicorn_test.exs:3: UnicornTest (module)
    (elixir) lib/kernel/parallel_compiler.ex:237: anonymous fn/4 in Kernel.ParallelCompiler.spawn_workers/7
```


Create that file in the `lib` directory (`touch lib/unicorn.ex`) and then run
your test again. Continue to follow the errors that your test provides until the
test passes. Then, unskip the next test by removing the lines that say `@tags
:skip` defined in `test/test_helper.exs`. Continue until all tests pass for all creatures.

## Suggested Order

* `unicorn_test.ex`
* `vampire_test.ex`
* `dragon_test.ex`
* `hobbit_test.ex`
* `pirate_test.ex`
* `wizard_test.ex`
* `medusa_test.ex`
* `werewolf_test.ex`
* `centaur_test.ex`
* `ogre_test.ex`

## Extra Challenges

### The Dreaded `if` Statement

Can you complete implementations of each of the creatures without using `if`
statements? Think about how removing them affects your code. Remember that
a `case` is just a different form of `if`, so don't use it.
