defmodule ListUtls do

  ## Returns a list with the contents reversed
  def reverse(list), do: reverse(list, [])

  defp reverse([], acc), do: acc
  defp reverse([head | tail], acc) do
    reverse tail, [head | acc]
  end


  ## Flattens a list
  def flatten(list) do
    reverse(flatten(list, []))
  end

  defp flatten([], acc), do: acc

  defp flatten([head | tail], acc) when is_list(head) do
    flatten(tail, flatten(head, []) ++ acc)
  end

  defp flatten([head | tail], acc) do
    flatten(tail, [head | acc])
  end

end
