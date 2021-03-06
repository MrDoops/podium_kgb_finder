defmodule GoogleLanguageClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :google_language_client,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {GoogleLanguageClient.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:google_api_language, "~> 0.1.0"},
      {:goth, "~> 0.6.0", override: true},
    ]
  end
end
