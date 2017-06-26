# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"

config :system_registry, SystemRegistry.Processor.Config,
  priorities: [
        :debug,
        :nerves_network
    ]

config :nerves_network,
  regulatory_domain: "US"

config :nerves, :firmware,
  rootfs_additions: "rootfs-additions"

# Boot the bootloader first and have it start our app.
config :bootloader,
  overlay_path: "/tmp/erl_bootloader",
  init: [:nerves_init_zero],
  app: :zero
