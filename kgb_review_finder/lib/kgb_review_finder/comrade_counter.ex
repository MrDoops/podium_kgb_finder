defmodule KgbReviewFinder.ComradeCounter do
  @moduledoc """
  Functions for f.
  """
  @behaviour SentimentAnalyzer
  @kgb_keywords ~W(comrade nyet stalin communism mother-russia free bomb soviet vodka)
  @patriotic_keywords ~W(america murica muscle bacon freedom capitalism money buy cheeseburger howdy dude banjo)

  def analyze_sentiment(text) do
    # count word occurrences
  end
end
