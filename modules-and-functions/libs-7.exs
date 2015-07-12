defmodule Libs do
  # Find the library functions to do the following, and then use each in iex. (If the word Elixir or Erlang appears at the end of the challenge, then you’ll find the answer in that set of libraries.)
  # 1. Convert a float to a string with two decimal digits. (Erlang)
  def float_to_string(float) when is_float(float) do
    :erlang.float_to_binary(float, [decimals: 2])
  end

  # 2. Get the value of an operating-system environment variable. (Elixir)
  def os_val(varname) do
    System.get_env(varname)
  end

  # 3. Return the extension component of a file name (so return .exs if given "dave/test.exs" ). (Elixir)
  def get_extension(filename) do
    Path.extname(filename)
  end

  # 4. Return the process’s current working directory. (Elixir)
  def pwd do
    System.get_env("PWD")
  end

  # 5. Convert a string containing JSON into Elixir data structures. (Just find; don’t install.)
  def json_to_struct(json_string) do
    case JSX.decode(json_string) do
      {:ok, decoded} -> decoded
      _ -> nil
    end
  end

  # 6. Execute a command in your OS shell
  def execute(command, args, opts \\ []) do
    System.cmd(command, args, opts)
  end
end
