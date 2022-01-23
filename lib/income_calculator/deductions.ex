defmodule IncomeCalculator.Deductions do
  @moduledoc """
  The Deductions context.
  """

  import Ecto.Query, warn: false
  alias IncomeCalculator.Repo
  alias IncomeCalculator.Deductions.Deduction

  @doc """
  Returns the list of deductions.

  ## Examples

      iex> list_deductions()
      [%Deduction{}, ...]

  """
  def list_deductions do
    Repo.all(Deduction)
  end

  @doc """
  Gets a single deduction.

  Raises `Ecto.NoResultsError` if the Deduction does not exist.

  ## Examples

      iex> get_deduction!(123)
      %Deduction{}

      iex> get_deduction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deduction!(id), do: Repo.get!(Deduction, id)

  @doc """
  Creates a deduction.

  ## Examples

      iex> create_deduction(%{field: value})
      {:ok, %Deduction{}}

      iex> create_deduction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deduction(attrs \\ %{}) do
    %Deduction{}
    |> Deduction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a deduction.

  ## Examples

      iex> update_deduction(deduction, %{field: new_value})
      {:ok, %Deduction{}}

      iex> update_deduction(deduction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deduction(%Deduction{} = deduction, attrs) do
    deduction
    |> Deduction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a deduction.

  ## Examples

      iex> delete_deduction(deduction)
      {:ok, %Deduction{}}

      iex> delete_deduction(deduction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deduction(%Deduction{} = deduction) do
    Repo.delete(deduction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deduction changes.

  ## Examples

      iex> change_deduction(deduction)
      %Ecto.Changeset{data: %Deduction{}}

  """
  def change_deduction(%Deduction{} = deduction, attrs \\ %{}) do
    Deduction.changeset(deduction, attrs)
  end

end
