defmodule IncomeCalculator.DeductionsTest do
  use IncomeCalculator.DataCase

  alias IncomeCalculator.Deductions

  describe "deductions" do
    alias IncomeCalculator.Deductions.Deduction

    import IncomeCalculator.DeductionsFixtures

    @valid_attrs %{amount: 1300.11, paycheck_id: 1}
    @invalid_attrs %{amount: "invalid"}

    test "list_deductions/0 returns all deductions" do
      deduction = deduction_fixture()
      assert Deductions.list_deductions() == [deduction]
    end

    test "get_deduction!/1 returns the deduction with given id" do
      deduction = deduction_fixture()
      assert Deductions.get_deduction!(deduction.id) == deduction
    end

    test "create_deduction/1 with valid data creates a deduction" do
      assert {:ok, %Deduction{} = _deduction} = Deductions.create_deduction(@valid_attrs)
    end

    test "create_deduction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Deductions.create_deduction(@invalid_attrs)
    end

    test "update_deduction/2 with valid data updates the deduction" do
      deduction = deduction_fixture()
      update_attrs = %{amount: 1300.12}
      assert {:ok, %Deduction{} = _deduction} = Deductions.update_deduction(deduction, update_attrs)
    end

    test "update_deduction/2 with invalid data returns error changeset" do
      deduction = deduction_fixture()
      assert {:error, %Ecto.Changeset{}} = Deductions.update_deduction(deduction, @invalid_attrs)
      assert deduction == Deductions.get_deduction!(deduction.id)
    end

    test "delete_deduction/1 deletes the deduction" do
      deduction = deduction_fixture()
      assert {:ok, %Deduction{}} = Deductions.delete_deduction(deduction)
      assert_raise Ecto.NoResultsError, fn -> Deductions.get_deduction!(deduction.id) end
    end

    test "change_deduction/1 returns a deduction changeset" do
      deduction = deduction_fixture()
      assert %Ecto.Changeset{} = Deductions.change_deduction(deduction)
    end
  end
end
