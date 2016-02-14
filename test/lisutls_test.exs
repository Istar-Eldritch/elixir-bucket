defmodule ListUtlsTest do
  use ExUnit.Case
  doctest ListUtls
  import ListUtls
  
  test "reverse" do
    assert reverse([]) == []
    assert reverse([1,2,3,4,5]) == [5, 4, 3, 2, 1]
  end

  test "flatten" do
    assert flatten([]) == []
    assert flatten([1, [2, 3, [4]], 5, [[[6]]]]) == [1, 2, 3, 4, 5, 6]
  end
end
