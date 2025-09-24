defmodule LearnElixir.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: SimpleHttpServer, options: [ip: {0,0,0,0}, port: 4000]}
      # To use Bandit instead, replace the above line with:
      # {Bandit.PhoenixAdapter, plug: SimpleHttpServer, scheme: :http, options: [port: 4000]}
    ]

    opts = [strategy: :one_for_one, name: LearnElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
