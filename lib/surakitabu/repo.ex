defmodule Surakitabu.Repo do
  use Ecto.Repo,
    otp_app: :surakitabu,
    adapter: Ecto.Adapters.Postgres
end
