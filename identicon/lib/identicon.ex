defmodule Identicon do
  @moduledoc """
  Setting up an identicon like on github for a default user image based on a hashed string
  """

  def main(input) do
    input
    |> hash_input
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
          |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
