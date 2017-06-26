defmodule Zero.Application do
  use Application
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      worker(Task, [fn -> init_network() end], restart: :transient, id: Nerves.Init.Network)
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Zero.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def init_network() do
    opts = Application.get_env(:hello_wifi, @interface)
    #Nerves.Network.setup(@interface, opts)
  end
end
