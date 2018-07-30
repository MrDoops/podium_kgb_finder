defmodule GoogleLanguageClientTest do
  use ExUnit.Case
  doctest GoogleLanguageClient

  test "greets the world" do
    assert GoogleLanguageClient.hello() == :world
  end
end
