defmodule HrsmsConsumer.Repo do
  use Ecto.Repo,
    otp_app: :hrsms_consumer,
    adapter: Ecto.Adapters.Postgres
end
