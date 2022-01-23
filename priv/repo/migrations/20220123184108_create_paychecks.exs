defmodule IncomeCalculator.Repo.Migrations.CreatePaychecks do
  use Ecto.Migration

  def change do
    create table(:paychecks) do
      add :hours, :integer
      add :rate, :float
      add :overtime_modifier, :float
      add :regular_hour_limit, :integer
      timestamps()
    end
  end
end
