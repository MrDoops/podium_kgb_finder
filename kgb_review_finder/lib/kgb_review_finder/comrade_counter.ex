defmodule KgbReviewFinder.ComradeCounter do
  @moduledoc """
  Simple counter of word occurrences. +1 for patriotic, -1 for russian.

  TODO:
    * Efficient reduce returns %{text: text, score: score}
  """
  @behaviour SentimentAnalyzer
  @kgb_keywords ~W(comrade nyet stalin communism mother russia homeland bomb soviet vodka)
  @patriotic_keywords ~W(america murica muscle bacon freedom capitalism money buy cheeseburger howdy dude banjo)

  def analyze(%{text: text}) do
    score =
      text
      |> account_for_keywords(@kgb_keywords, -1)
      |> account_for_keywords(@patriotic_keywords, +1)

    {:ok, %{text: text, score: score}}
  end

  def analyze(text) when is_binary(text) do
    analyze(%{text: text})
  end

  defp account_for_keywords(arg1, arg2, arg3), do: arg1

  defp account_for_keyword(text, word, weight), do:
    account_for_keywords(text, word, weight, 0)

  defp account_for_keyword(text, word, weight, score) do
    %{text: text, score: score + weight}
  end
end
