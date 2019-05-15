defmodule Identicon do
  @moduledoc """
  Setting up an identicon like on github for a default user image based on a hashed string
  """

  def main(input) do
    input
    |> hash_input
  end

  def hash_input(input) do
    input
  end
end
