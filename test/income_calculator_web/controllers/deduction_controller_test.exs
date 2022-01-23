#defmodule IncomeCalculatorWeb.DeductionControllerTest do
#  use IncomeCalculatorWeb.ConnCase
#
#  import IncomeCalculator.DeductionsFixtures
#
#  @create_attrs %{}
#  @update_attrs %{}
#  @invalid_attrs %{}
#
#  describe "index" do
#    test "lists all deductions", %{conn: conn} do
#      conn = get(conn, Routes.deduction_path(conn, :index))
#      assert html_response(conn, 200) =~ "Listing Deductions"
#    end
#  end
#
#  describe "new deduction" do
#    test "renders form", %{conn: conn} do
#      conn = get(conn, Routes.deduction_path(conn, :new))
#      assert html_response(conn, 200) =~ "New Deduction"
#    end
#  end
#
#  describe "create deduction" do
#    test "redirects to show when data is valid", %{conn: conn} do
#      conn = post(conn, Routes.deduction_path(conn, :create), deduction: @create_attrs)
#
#      assert %{id: id} = redirected_params(conn)
#      assert redirected_to(conn) == Routes.deduction_path(conn, :show, id)
#
#      conn = get(conn, Routes.deduction_path(conn, :show, id))
#      assert html_response(conn, 200) =~ "Show Deduction"
#    end
#
#    test "renders errors when data is invalid", %{conn: conn} do
#      conn = post(conn, Routes.deduction_path(conn, :create), deduction: @invalid_attrs)
#      assert html_response(conn, 200) =~ "New Deduction"
#    end
#  end
#
#  describe "edit deduction" do
#    setup [:create_deduction]
#
#    test "renders form for editing chosen deduction", %{conn: conn, deduction: deduction} do
#      conn = get(conn, Routes.deduction_path(conn, :edit, deduction))
#      assert html_response(conn, 200) =~ "Edit Deduction"
#    end
#  end
#
#  describe "update deduction" do
#    setup [:create_deduction]
#
#    test "redirects when data is valid", %{conn: conn, deduction: deduction} do
#      conn = put(conn, Routes.deduction_path(conn, :update, deduction), deduction: @update_attrs)
#      assert redirected_to(conn) == Routes.deduction_path(conn, :show, deduction)
#
#      conn = get(conn, Routes.deduction_path(conn, :show, deduction))
#      assert html_response(conn, 200)
#    end
#
#    test "renders errors when data is invalid", %{conn: conn, deduction: deduction} do
#      conn = put(conn, Routes.deduction_path(conn, :update, deduction), deduction: @invalid_attrs)
#      assert html_response(conn, 200) =~ "Edit Deduction"
#    end
#  end
#
#  describe "delete deduction" do
#    setup [:create_deduction]
#
#    test "deletes chosen deduction", %{conn: conn, deduction: deduction} do
#      conn = delete(conn, Routes.deduction_path(conn, :delete, deduction))
#      assert redirected_to(conn) == Routes.deduction_path(conn, :index)
#
#      assert_error_sent 404, fn ->
#        get(conn, Routes.deduction_path(conn, :show, deduction))
#      end
#    end
#  end
#
#  defp create_deduction(_) do
#    deduction = deduction_fixture()
#    %{deduction: deduction}
#  end
#end
