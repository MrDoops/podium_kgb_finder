defmodule GoogleLanguageClient do
  alias GoogleApi.Language.V1.Model.{
    AnalyzeSentimentRequest,
    AnalyzeSentimentResponse,
    Document
  }

  alias GoogleApi.Language.V1.Api.Documents
  alias GoogleLanguageClient.Auth

  def get_sentiment_score(text) when is_binary(text) do
    with conn <- Auth.fetch_authenticated_connection(),
         request <- build_sentiment_request(text),
         {:ok, response} <- send_sentiment_request(request, conn) do
      {:ok, parse_sentiment_score(response)}
    else
      {:error, info} -> {:error, info}
    end
  end

  defp build_sentiment_request(text) do
    %AnalyzeSentimentRequest{
      document: %Document{
        content: text,
        language: "en",
        type: "PLAIN_TEXT"
      },
      encodingType: "UTF8"
    }
  end

  defp send_sentiment_request(%AnalyzeSentimentRequest{} = request, conn) do
    case Documents.language_documents_analyze_sentiment(conn, body: request) do
      {:ok, response} -> {:ok, response}
      {:error, _} -> {:error, "Error occurred sending sentiment request"}
    end
  end

  defp parse_sentiment_score(%AnalyzeSentimentResponse{} = response) do
    response.documentSentiment.score
  end
end
