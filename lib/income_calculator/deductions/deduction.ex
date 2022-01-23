defmodule IncomeCalculator.Deductions.Deduction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "deductions" do
    field :amount, :float
    belongs_to :paycheck, IncomeCalculator.Paychecks.Paycheck
    timestamps()
  end

  @doc false
  def changeset(deduction, attrs) do
    deduction
    |> cast(attrs, [:amount, :paycheck_id])
    |> validate_required([:amount, :paycheck_id])
  end
end
