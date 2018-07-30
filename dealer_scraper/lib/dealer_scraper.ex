defmodule DealerScraper do
  @moduledoc """
  Fetches, parses, and formats review data from DealerRater pages.
  """
  alias DealerScraper.Parsing

  @dealer_url "https://www.dealerrater.com/dealer"
  @suspicious_dealer_slug "McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685"

  def fetch_mckaig_review_data(pages), do:
    fetch_dealer_review_data(pages, @suspicious_dealer_slug)

  @doc """
  Returns a list of maps with review data.
  """
  def fetch_dealer_review_data(pages, dealer_slug) when is_integer(pages) do
    1..pages
    |> Enum.map(
      &Task.async(fn ->
        fetch_reviews("#{@dealer_url}/#{dealer_slug}/page#{&1}")
      end)
    )
    |> Enum.map(&Task.await/1)
    |> List.flatten()
  end

  # Fetches a list of maps containing data on each review for a page.
  defp fetch_reviews(url) do
    case fetch_html(url) do
      {:ok, html} ->
        Parsing.parse_reviews(html)
      {:error, msg} ->
        msg
    end
  end

  defp fetch_html(url) do
    case Tesla.get(url) do
      {:ok, response} ->
        {:ok, response.body}

      {:error, _error} ->
        {:error, "There was an issue fetching #{url}"}
    end
  end
end
