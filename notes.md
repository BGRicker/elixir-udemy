`mix` command creates projects, compiles projects, runs 'tasks,' and manages dependencies

`mix new cards` creates a new project called cards

$ `iex` - interactive elixir shell
$ `iex -S mix` - interactive elixir shell with access to repo
`recompile` in iex recompiles to load changes

ruby => suits.each do |suit|
elixir => for suit <- suits do

ruby => suits.each do |suit|
          ranks.each do |rank|
elixir => for suit <- suits, rank <- ranks do

elixir tuple like an array where each index has special meaning, selected or remainder
  - dealing cards, first element would be what your cards are
  - second element would be the remaining, unselected cards

{[""Ace of Clubs", "Four of Clubs", "Two of Diamonds"],
  ["Four of Diamonds", "Four of Spades", "Ace of Spades", "Three of Spades",
  "Five of Diamonds", "Five of Spades", "Five of Hearts", "Three of Clubs",
  "Five of Clubs", "Ace of Diamonds", "Two of Hearts", "Two of Clubs",
  "Ace of Hearts", "Four of Hearts", "Two of Spades"]}

pattern matching - "Elixir's replacement for variable assignment" 
  - { hand, rest_of_deck} = Cards.deal(deck, 5)
  - value on left hand side matches value on right, Elixir tries to match the
    pattern and put the first elements in the hand variable, remaining in rest
  - `hand` variable now returns cards dealt, rest returns the rest
  - color = ["red"] #=> ["red"]
  - [color] = ["red"] #=> "red"
  - [color1, color2] = ["red", "blue"] #=> color1 => "red", color2 => "blue"
  - [c1, c2 ,c3] = ["red", "blue"] #=> MatchError no match of right hand side

pipe operator
pre-pipe:
  def create_hand(hand_size) do
    deck = Cards.create_deck
    deck = Cards.shuffle(deck)
    hand = Cards.deal(deck, hand_size)
  end

post-pipe:
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

result of each function is auto-passed down to next function in chain
  - elixir automatically injects as first argument
  - consistent first arguments allows you to chain like this

doctests:
  - writing documentation that can be tested with `mix test` as doctests:

  @doc """
    checks to see if a card is contained within the deck

  ## Examples

  iex> deck = Cards.create_deck
  iex> Cards.contains?(deck, "Ace of Spades")
  true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  - `iex>` code runs and makes assertion based on last line of code `true`

maps:
  - key/value pairs, like hashes in Ruby
  - colors = %{primary: "red", secondary: "blue"}
  - colors.primary #=> "red"
  - %{secondary: secondary_color} = colors # pattern matching
    - elixir looks at colors, does it have a top level map on either side?
    - does colors have a key of secondary?
  - secondary_color = "blue"

  - updating a map creates a copy of the map, doesn't update it:
    - colors = %{primary: red}
    - iex(7)> colors #=> %{primary: "red"}
    - iex(8)> Map.put(colors, :primary, "blue") #=> %{primary: "blue"}
    - iex(9)> colors #=> %{primary: "red"}
    - %{ colors | primary: "blue" } # another way to update a hash/map value

tuples and keyword lists:
  - colors = [{:primary, "red"}, {:secondary, "green"}] #=> [primary: red, secondary: "green"]
    - colors[:primary] #=> "red"
  - colors = [primary: "red", secondary: "blue"] #=> [primary: "red", secondary: "blue"]
  - tuple:
    - %{primary: "red", primary: "blue"} #=> %{primary: "blue"}
  - keyword list:
    - [primary: "blue", primary: "red"] #=> [primary: "blue", primary: "red"]
    - keyword lists used in Ecto for DB work in Phoenix:
      - query = User.find_where([where: user.age > 10, where: user.subscribed = true])
      - query = User.find_where where: user.age > 10, where: user.subscribed = true

Structs
  defining a Struct:
    defmodule Identicon.Image do
      defstruct hex: nil
    end
  using a Struct in iex:
  - %Identicon.Image{hex: "cool"}
  - Structs enforce that the only properties allowed are defined in that module
  - this struct is just a map, no functions would work in that Struct module

Pattern Matching first elements of array
  - if you want to ignore later elements of a List, use | \_tail
  - cool = [1, 2, 3, 4]
  - [first, second | \_tail] = cool
  - [first, second] #=> 1, 2
