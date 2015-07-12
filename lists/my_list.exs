defmodule MyList do
  # Write a mapsum function that takes a list and a function. It applies the function to each element of the list and then sums the result, so
  # iex> MyList.mapsum [1, 2, 3], &(&1 * &1) 14
  def mapsum(collection, func) do
    mapsum(collection, func, 0)
  end
  defp mapsum([], _, accum) do
    accum
  end
  defp mapsum([head|tail], func, accum) do
    mapsum(tail, func, accum + func.(head))
  end

  # Write a max(list) that returns the element with the maximum value in the list. (This is slightly trickier than it sounds.)
  def max(list) when is_list(list), do: maxim(list, nil)
  defp maxim([], nil), do: nil
  defp maxim([head|tail], nil), do: maxim(tail, head)
  defp maxim([], maximum), do: maximum
  defp maxim([head|tail], maximum) when head >= maximum, do: maxim(tail, head)
  defp maxim([head|tail], maximum) when head < maximum, do: maxim(tail, maximum)

  # An Elixir single-quoted string is actually a list of individual character codes. Write a caesar(list, n) function that adds n to each list element, wrapping if the addition results in a character greater than z . iex> MyList.caesar( 'ryvkve' , 13) ?????? :)
  def caesar(list, n), do: Enum.map(list, &(&1 + n))
end
