defmodule Socialmarketvms.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SocialmarketvmsWeb.Telemetry,
      Socialmarketvms.Repo,
      {DNSCluster, query: Application.get_env(:socialmarketvms, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Socialmarketvms.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Socialmarketvms.Finch},
      # Start a worker by calling: Socialmarketvms.Worker.start_link(arg)
      # {Socialmarketvms.Worker, arg},
      # Start to serve requests, typically the last entry
      SocialmarketvmsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Socialmarketvms.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SocialmarketvmsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
