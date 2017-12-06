defmodule CardTest do
  use ExUnit.Case
  doctest Card

  test "greets the world" do
    assert Card.hello() == :world
  end

  test "create_deck monta um baralho com 20 cartas" do
    assert (Card.create_deck |> length) == 48
  end

  test "embaralha as cartas" do
    deck = Card.create_deck
    assert deck != Card.shuffle(deck)
  end

end
