defmodule ExTwitch.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      ExTwitch.TokenManager
    ]
    opts = [strategy: :one_for_one, name: ExTwitch.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
