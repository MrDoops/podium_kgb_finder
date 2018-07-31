defmodule SentimentAnalyzer do
  @callback analyze(String.t) :: {:ok, {String.t, integer()}} | {:error, any}
end
