defmodule IncomeCalculator.Repo.Migrations.CreateDeductions do
  use Ecto.Migration

  def change do
    create table(:deductions) do
      add :amount, :float
      add :paycheck_id, :integer
      timestamps()
    end
  end
end
