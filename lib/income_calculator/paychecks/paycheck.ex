defmodule IncomeCalculator.Paychecks.Paycheck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "paychecks" do
    field :hours, :integer
    field :rate, :float
    field :overtime_modifier, :float
    field :regular_hour_limit, :integer
    has_many :deductions, IncomeCalculator.Deductions.Deduction
    timestamps()
  end

  @doc false
  def changeset(paycheck, attrs) do
    paycheck
    |> cast(attrs, [:hours, :rate])
    |> validate_required([:hours, :rate])
  end
end
