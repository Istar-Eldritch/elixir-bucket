defmodule GCD do

  defp of(i, n1, _, acc) when i > n1, do: acc
  defp of(i, n1, n2, acc) when rem(n1, i) == 0 and rem(n2, i) == 0 do
      of(i + 1, n1, n2, i)
  end
  defp of(i, n1, n2, acc), do: of(i + 1, n1, n2, acc)

  def of(0, n), do: n
  def of(n1, n2), do: of(1, n1, n2, 0)
end
