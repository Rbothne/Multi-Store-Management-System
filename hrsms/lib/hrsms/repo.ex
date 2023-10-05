defmodule Hrsms.Repo do
  use Ecto.Repo,
    otp_app: :hrsms,
    adapter: Ecto.Adapters.Postgres
end
