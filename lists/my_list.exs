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

  # Write a function MyList.span(from, to) that returns a list of the numbers from from up to to .
  def span(from, to) when to > from, do: Enum.map(from..to, &(&1))

  def charge do
    tax_rates = [ NC: 0.075, TX: 0.08 ]
    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount: 35.50 ],
      [ id: 125, ship_to: :TX, net_amount: 24.00 ],
      [ id: 126, ship_to: :TX, net_amount: 44.80 ],
      [ id: 127, ship_to: :NC, net_amount: 25.00 ],
      [ id: 128, ship_to: :MA, net_amount: 10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount: 50.00 ]
    ]

    Enum.map(orders, fn(order) ->
      ship_to = order[:ship_to]
      net_amount = order[:net_amount]
      total_amount = case tax_rates[ship_to] do
        nil -> net_amount
        tax_rate -> net_amount + net_amount * tax_rate
      end
      order ++ [total_amount: total_amount]
    end)
  end
end
