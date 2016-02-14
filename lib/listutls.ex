defmodule ListUtls do
  
  defp flatten([], acc), do: acc

  defp flatten([head | tail], acc) when is_list(head) do
    flatten(tail, flatten(head, []) ++ acc)
  end

  defp flatten([head | tail], acc) do
    flatten(tail, [head | acc])
  end

  def flatten(list) do
    Enum.reverse(flatten(list, []))
  end

end
