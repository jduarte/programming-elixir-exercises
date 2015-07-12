# I’m thinking of a number between 1 and 1000.
# The most efficient way to find the number is to guess halfway between the low and high numbers of the range.
# If our guess is too big, then the answer lies between the bottom of the range and one less than our guess.
# If our guess is too small, then the answer lies between one more than our guess and the end of the range.

# Your API will be guess(actual, range) , where range is an Elixir range.
# Your output should look similar to this:

# iex> Chop.guess(273, 1..1000)
# Is it 500
# Is it 250
# Is it 375
# Is it 312
# Is it 281
# Is it 265
# Is it 273
# 273
defmodule Chop do
  def guess(actual, range) when is_integer(actual) do
    bottom..top = range
    test_with(actual, bottom, top)
  end

  defp test_with(actual, bottom, top) do
    (bottom + top) / 2
    |> Float.floor
    |> round
    |> is_it(actual, bottom, top)
  end
  defp is_it(guess, actual, _, _) when actual == guess, do: IO.puts(actual)
  defp is_it(guess, actual, bottom, _) when guess > actual do
    IO.puts("Is it #{guess}")
    test_with(actual, bottom, guess - 1)
  end
  defp is_it(guess, actual, _, top) when guess < actual do
    IO.puts("Is it #{guess}")
    test_with(actual, guess + 1, top)
  end
end
