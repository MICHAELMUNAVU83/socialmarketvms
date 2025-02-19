defmodule Socialmarketvms.Repo do
  use Ecto.Repo,
    otp_app: :socialmarketvms,
    adapter: Ecto.Adapters.Postgres
end
