defmodule DealerScraper.Review do
  @moduledoc """
  Structured DealerRater reviews.
  """
  defstruct [
    :review_content,
    :reviewer,
    :rating,
    :posted_on,
  ]
end
