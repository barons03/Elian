defmodule Elian.Repo do
  use Ecto.Repo,
    otp_app: :elian,
    adapter: Ecto.Adapters.Postgres
end
