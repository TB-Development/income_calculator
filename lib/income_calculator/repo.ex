defmodule IncomeCalculator.Repo do
  use Ecto.Repo,
    otp_app: :income_calculator,
    adapter: Ecto.Adapters.Postgres
end
