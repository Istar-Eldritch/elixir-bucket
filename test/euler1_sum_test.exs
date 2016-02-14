defmodule Euler1SumTest do
  use ExUnit.Case
  doctest Euler1Sum
 
  test "ismult" do
    assert Euler1Sum.is_mult(9, [3,5])
    assert Euler1Sum.is_mult(6, [3])
    assert Euler1Sum.is_mult(10, [3, 5])
    assert Euler1Sum.is_mult(7, [3]) == false
  end

  test "multiples" do
    assert Euler1Sum.multiples([3, 5], 10)
           |> Enum.to_list
           == [3, 5, 6, 9] 
  end

  test "sum" do
    assert Euler1Sum.sum([3, 5], 10) == 23
  end
 
end
