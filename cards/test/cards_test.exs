defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck creates 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "create_hand draws hands based on hand_size cards" do
    {two_cards, deck} = Cards.create_hand(2)
    deck_size = length(two_cards)
    assert deck_size == 2
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
