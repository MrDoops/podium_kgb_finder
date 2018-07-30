defmodule GoogleLanguageClient.Auth do
  @auth_scope "https://www.googleapis.com/auth/cloud-platform"

  def fetch_authenticated_connection() do
    with {:ok, token} <- fetch_authenticated_token() do
      GoogleApi.Language.V1.Connection.new(token)
    end
  end

  defp fetch_authenticated_token() do
    case Goth.Token.for_scope(@auth_scope) do
      {:ok, token} -> {:ok, token.token}
      :error -> {:error, "Error fetching Authenticated Token"}
    end
  end
end
