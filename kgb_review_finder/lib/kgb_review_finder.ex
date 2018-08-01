defmodule KgbReviewFinder do
  @moduledoc """
  WIP tool used to find extra suspicious KGB Reviews on http://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-review-23685/

  TODO:
    * Generic DealerRater review analysis
    * Arbitrary strategy processing
    * Google NLP Sentiment strategy:
      - client application w/o dependency conflicts
  """
  alias DealerScraper
  alias KgbReviewFinder.{
    ComradeCounter,
    Afinn,
  }

  @doc """
  Prints the most overly positive reviews in the console.

  TODO:
    * accept 1 or more or :all analysis strategies
    * streamed review processing for large quantities
  """
  def list_most_positive_mckaig_reviews(amount) when is_integer(amount) do
    with {:ok, reviews} <- DealerScraper.fetch_mckaig_review_data(5) do
      reviews
      |> analyze_with_strategy(:comrade_counter)
      |> Enum.sort(&(Map.get(&1, :score) >= Map.get(&2, :score)))
      |> List.pop_at(0..amount)
    else
      {:error, _} ->
        IO.puts("An error occurred analyzing potential KGB reviews...coincidence?")
    end
  end

  defp analyze_with_strategy(reviews, :comrade_counter) do
    reviews
    |> Enum.map(
      &Task.async(fn ->
        ComradeCounter.analyze(&1)
      end)
    )
    |> Enum.map(&Task.await/1)
  end

  # defp analyze_with_strategy(reviews, :afinn) do
  #   reviews
  #   |> Enum.map(
  #     &Task.async(fn ->
  #       Afinn.analyze(&1)
  #     end)
  #   )
  #   |> Enum.map(&Task.await/1)
  # end

end
