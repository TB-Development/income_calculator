defmodule IncomeCalculator.Paychecks do
  @moduledoc """
  The Paychecks context.
  """

  import Ecto.Query, warn: false
  alias IncomeCalculator.Repo

  alias IncomeCalculator.Paychecks.Paycheck

  @doc """
  Returns the list of paychecks.

  ## Examples

      iex> list_paychecks()
      [%Paycheck{}, ...]

  """
  def list_paychecks do
    Repo.all(Paycheck)
  end

  @doc """
  Gets a single paycheck.

  Raises `Ecto.NoResultsError` if the Paycheck does not exist.

  ## Examples

      iex> get_paycheck!(123)
      %Paycheck{}

      iex> get_paycheck!(456)
      ** (Ecto.NoResultsError)

  """
  def get_paycheck!(id), do: Repo.get!(Paycheck, id)

  @doc """
  Creates a paycheck.

  ## Examples

      iex> create_paycheck(%{field: value})
      {:ok, %Paycheck{}}

      iex> create_paycheck(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_paycheck(attrs \\ %{}) do
    %Paycheck{}
    |> Paycheck.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a paycheck.

  ## Examples

      iex> update_paycheck(paycheck, %{field: new_value})
      {:ok, %Paycheck{}}

      iex> update_paycheck(paycheck, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_paycheck(%Paycheck{} = paycheck, attrs) do
    paycheck
    |> Paycheck.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a paycheck.

  ## Examples

      iex> delete_paycheck(paycheck)
      {:ok, %Paycheck{}}

      iex> delete_paycheck(paycheck)
      {:error, %Ecto.Changeset{}}

  """
  def delete_paycheck(%Paycheck{} = paycheck) do
    Repo.delete(paycheck)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking paycheck changes.

  ## Examples

      iex> change_paycheck(paycheck)
      %Ecto.Changeset{data: %Paycheck{}}

  """
  def change_paycheck(%Paycheck{} = paycheck, attrs \\ %{}) do
    Paycheck.changeset(paycheck, attrs)
  end

  @doc """
  Returns gross income for a paycheck.

  ## Examples
    {:ok, paycheck} = IncomeCalculator.Paychecks.create_paycheck(%{hours: 40, rate: 21.00})
    {:ok, deduction} = IncomeCalculator.Deductions.create_deduction(%{amount: 105.11, paycheck_id: paycheck.id})
    IncomeCalculator.Paychecks.gross_income(paycheck)
  """
  def gross_income(paycheck) do
    paycheck.hours * paycheck.rate
  end

  @doc """
  Returns gross income - deductions for a paycheck.

  ## Examples
    {:ok, paycheck} = IncomeCalculator.Paychecks.create_paycheck(%{hours: 40, rate: 21.00})
    {:ok, deduction} = IncomeCalculator.Deductions.create_deduction(%{amount: 105.11, paycheck_id: paycheck.id})
    IncomeCalculator.Paychecks.net_income(paycheck)
  """
  def net_income(paycheck) do
    (gross_income(paycheck)) - (paycheck |> Repo.preload(:deductions) |> deduction_total())
  end

  def deduction_total(paycheck) do
    paycheck.deductions
    |> Enum.map(&(&1.amount))
    |> Enum.sum()
  end

end
