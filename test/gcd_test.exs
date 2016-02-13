defmodule GCDTest do
  use ExUnit.Case
  doctest GCD

  test "gdc" do
    assert GCD.of(5, 10) == 5
    assert GCD.of(6, 9) == 3
    assert GCD.of(0, 7) == 7
  end
end
