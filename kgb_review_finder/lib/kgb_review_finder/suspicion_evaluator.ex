defmodule KgbReviewFinder.SuspicionEvaluator do
  @moduledoc """
  Functions for fetching analyzing the suspicion reviews.
  """

  alias DealerScraper.Review

  defp get_sentiment_score(text) do
    {text, fetch_reviews(GoogleLanguageClient.get_sentiment_score(text))}
  end
end
