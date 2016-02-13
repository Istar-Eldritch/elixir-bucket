defmodule ListUtlsTest do
  use ExUnit.Case
  doctest ListUtls
  import ListUtls

  test "flatten" do
    assert flatten([]) == []
    assert flatten([1, [2, 3, [4]], 5, [[[6]]]]) == [1, 2, 3, 4, 5, 6]
  end
end
