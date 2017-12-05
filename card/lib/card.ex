defmodule Card do
  @moduledoc """
  Documentation for Card.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Card.hello
      :world

  """
  def hello do
    :world
  end

  def create_deck do
    values = ["Ace", "Two", "Tree", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonts"]

   # cards = for value <- values do 
   #   for suit <-suits do
   #     "#{value} of #{suit}"
   #   end
   # end
   # List.flatten(cards)

    for value <-values, suit<-suits do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck)  do
    Enum.shuffle(deck)
  end

  def contains?(deck, card)do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
        
  end

end
