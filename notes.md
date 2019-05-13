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
