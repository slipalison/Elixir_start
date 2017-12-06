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
    values = ["Ás", "2", "3", "4", "5", "6", "7", "8", "9", "Valete", "Dama", "Rei"]
    suits = ["Espada", "Copa", "Pau", "Ouro"]

   # cards = for value <- values do 
   #   for suit <-suits do
   #     "#{value} of #{suit}"
   #   end
   # end
   # List.flatten(cards)

    for value <-values, suit<-suits do
      "#{value} de #{suit}"
    end

  end

  def shuffle(deck)  do
    Enum.shuffle(deck)
  end

  def contains?(deck, card)do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
     Enum.split(deck,hand_size)   
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary) 
  end

  def load(filename) do
    #{status, binary} = File.read(filename)
    #case status do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Card.create_deck 
    |> Card.shuffle 
    |> Card.deal(hand_size)
  end


end
