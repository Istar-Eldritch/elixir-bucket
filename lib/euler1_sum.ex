defmodule Euler1Sum do
  
  # If we list all the natural numbers below 10 that are multiples of 3 or 5,
  # we get 3, 5, 6 and 9. The sum of these multiples is 23.
  #
  #  Find the sum of all the multiples of 3 or 5 below 1000.
  
  defp is_mult(_,_,true), do: true
  defp is_mult(_, [], acc), do: acc
  defp is_mult(n, [head | tail], false) do
    is_mult(n, tail, rem(n, head) == 0)
  end

  def is_mult(n, list), do: is_mult(n, list, false)

  def multiples(mult, top) do
    Stream.filter 1..(top - 1), fn n -> is_mult(n, mult) end
  end

  def sum(mult, top) do
    multiples(mult, top)
    |> Enum.to_list
    |> Enum.reduce &(&1 + &2)
  end
end
