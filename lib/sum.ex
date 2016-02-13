defmodule Sum do

  def of(n) when n > 0, do: of(n, 0)

  defp of(0, acc), do: acc

  defp of(n, acc), do: of(n - 1, acc + n)
end
