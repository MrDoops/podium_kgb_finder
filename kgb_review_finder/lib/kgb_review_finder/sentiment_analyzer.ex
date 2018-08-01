defmodule SentimentAnalyzer do
  @moduledoc """
  TODO:
    * More specific spec on analyze requiring strategy_score()
  """
  # @callback analyze(String.t()) :: {:ok, %{text: String.t(), required(atom()) => strategy_score()}} | {:error, any}
  @callback analyze(String.t()) :: any()
  @type strategy_score() :: %{required(atom()) => integer()}
end
