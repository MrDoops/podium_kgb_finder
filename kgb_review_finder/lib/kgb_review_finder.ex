defmodule KgbReviewFinder do
  @moduledoc """
  Use to find extra suspicious KGB Reviews on http://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-review-23685/
  """
  alias DealerScraper
  alias KgbReviewFinder.ComradeCounter

  @doc """
  Prints the top 3 overly positive reviews in the console.
  """
  def list_most_positive_mckaig_reviews(amount) do
    with {:ok, reviews} <- DealerScraper.fetch_mckaig_review_data(5) do
      reviews
      |> Enum.map(
        &Task.async(fn ->
          ComradeCounter.analyze_sentiment(&1)
        end)
      )
      |> Enum.map(&Task.await/1)
      |> Enum.sort()
      |> List.pop_at(0..2)
    else
      {:error, _} ->
        IO.puts("An error occurred finding potential KGB reviews...coincidence?")
    end
  end

end
