defmodule ExTwitch.API do
  use Tesla

  alias ExTwitch.TokenManager

  plug Tesla.Middleware.BaseUrl, "https://api.twitch.tv"
  plug Tesla.Middleware.JSON

  def users(opts) do
    login_tuples = Keyword.get(opts, :login) |> to_tuples("login")
    id_tuples = Keyword.get(opts,:id) |> to_tuples("id")

    data =
      read_token()
      |> build_client(:helix)
      |> get("/helix/users?" <> to_query_parameters(login_tuples ++ id_tuples))
      |> data

    {:ok, data}
  end

  def emotes() do
    data =
      read_token()
      |> build_client(:kraken)
      |> get("/kraken/chat/emoticons")

    {:ok, data}
  end

  defp read_token() do
    {:ok, token} = TokenManager.token()
    token
  end

  defp build_client(token, env) do
    Tesla.build_client [
      {Tesla.Middleware.Headers, client_headers(env, token)}
    ]
  end

  defp client_headers(:kraken, _) do
    %{"Client-ID" => System.get_env("TWITCH_CLIENT_ID")}
  end

  defp client_headers(:helix, token) do
    %{"Authorization" => "Bearer " <> token}
  end


  defp data(%Tesla.Env{body: %{"data" => data}}), do: data

  defp to_tuples(nil, _tuple_key), do: []
  defp to_tuples(list, tuple_key), do: Enum.map(list, & {tuple_key, &1})

  defp to_query_parameters(list) do
    list
    |> Enum.map(fn({key, value}) -> key <> "=" <> value end)
    |> Enum.join("&")
  end
end
