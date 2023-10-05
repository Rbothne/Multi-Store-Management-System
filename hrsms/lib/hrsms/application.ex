defmodule Hrsms.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HrsmsWeb.Telemetry,
      # Start the Ecto repository
      Hrsms.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hrsms.PubSub},
      # Start Finch
      {Finch, name: Hrsms.Finch},
      # Start the Endpoint (http/https)
      HrsmsWeb.Endpoint
      # Start a worker by calling: Hrsms.Worker.start_link(arg)
      # {Hrsms.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hrsms.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HrsmsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
