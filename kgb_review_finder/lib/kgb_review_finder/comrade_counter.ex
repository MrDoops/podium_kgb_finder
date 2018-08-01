defmodule KgbReviewFinder.ComradeCounter do
  @moduledoc """
  WIP. Simple counter of word occurrences. +1 for patriotic, -1 for russian.

  TODO:
    * Efficient reduce returns %{text: text, comrade: %{score: score}}

  Look Into:
    * Flow for counting words efficiently
    * per sentence sentiment
    * KGB word count: comrade_counter: %{kgb_word_count: integer}
    * Patriotic word count: comrade_counter: %{patriot_word_count: integer}
  """
  @behaviour SentimentAnalyzer
  @kgb_keywords ~W(comrade nyet stalin communism mother russia homeland bomb soviet vodka)
  @patriotic_keywords ~W(america murica muscle bacon freedom capitalism money buy cheeseburger howdy dude banjo)

  def analyze(%{text: text}) do
    score =
      text
      |> account_for_keywords(@kgb_keywords, -1)
      |> account_for_keywords(@patriotic_keywords, +1)

    {:ok, %{text: text, comrade_counter: %{score: score}}}
  end

  def analyze(text) when is_binary(text) do
    analyze(%{text: text})
  end

  defp account_for_keywords(text, words, weight) do
    # break into sentences
  end

  defp account_for_keyword(text, word, weight), do:
    account_for_keywords(text, word, weight, 0)

  defp account_for_keyword(text, word, weight, score) do
    %{text: text, score: score + weight}
  end
end
