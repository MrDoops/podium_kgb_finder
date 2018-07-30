defmodule DealerScraper.Parsing do
  @moduledoc """
  Responsible for parsing HTML of dealerrater.com
  """
  # alias DealerScraper.Review

  def parse_reviews(html) do
    html
    |> find_review_entries()
    |> Enum.map(&build_review(&1))
  end

  defp find_review_entries(html), do: Floki.find(html, ".review-entry")

  defp build_review(review_entry_html) do
    formatted_review_content(review_entry_html)
  end

  defp formatted_review_content(review_entry_html) do
    review_entry_html
    |> Floki.find(".review-content")
    |> Floki.text()
    |> format_review_text()
  end

  defp format_review_text(text) do
    text
    |> String.replace("\n", " ")
    |> String.replace("\r", "")
  end
end
