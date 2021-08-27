defmodule TmsApi.Repo do
  use Ecto.Repo,
    otp_app: :tms_api,
    adapter: Ecto.Adapters.Postgres
end
