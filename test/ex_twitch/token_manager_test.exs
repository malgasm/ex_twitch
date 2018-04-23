defmodule ExTwitch.TokenManagerTest do
  use ExUnit.Case, async: true

  alias ExTwitch.TokenManager

  setup do
    start_supervised TokenManager

    %{}
  end

  test "should get the oauth token" do
    {:ok, token} = TokenManager.token()

    assert token != nil
  end
end