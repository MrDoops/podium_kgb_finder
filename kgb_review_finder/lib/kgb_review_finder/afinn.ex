defmodule KgbReviewFinder.Afinn do
  @moduledoc """
  Behavior wrapper around a library that Veritaserum a library that processes text
  using the [AFINN dataset](http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010)

  TODO:
    * implement sentence parsing
    * reduce score from sentences
  """
  @behaviour SentimentAnalyzer

  def analyze(text) do
    score = Veritaserum.analyze(text)
    %{text: text, afinn: %{score: score}}
  end
end
