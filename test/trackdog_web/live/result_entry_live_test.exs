defmodule TrackdogWeb.ResultEntryLiveTest do
  use TrackdogWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Trackdog.Events

  @create_attrs %{driver: 42, finish: 42, points: 42, result: 42, start: 42}
  @update_attrs %{driver: 43, finish: 43, points: 43, result: 43, start: 43}
  @invalid_attrs %{driver: nil, finish: nil, points: nil, result: nil, start: nil}

  defp fixture(:result_entry) do
    {:ok, result_entry} = Events.create_result_entry(@create_attrs)
    result_entry
  end

  defp create_result_entry(_) do
    result_entry = fixture(:result_entry)
    %{result_entry: result_entry}
  end

  describe "Index" do
    setup [:create_result_entry]

    test "lists all result_entries", %{conn: conn, result_entry: result_entry} do
      {:ok, _index_live, html} = live(conn, Routes.result_entry_index_path(conn, :index))

      assert html =~ "Listing Result entries"
    end

    test "saves new result_entry", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.result_entry_index_path(conn, :index))

      assert index_live |> element("a", "New Result entry") |> render_click() =~
               "New Result entry"

      assert_patch(index_live, Routes.result_entry_index_path(conn, :new))

      assert index_live
             |> form("#result_entry-form", result_entry: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#result_entry-form", result_entry: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.result_entry_index_path(conn, :index))

      assert html =~ "Result entry created successfully"
    end

    test "updates result_entry in listing", %{conn: conn, result_entry: result_entry} do
      {:ok, index_live, _html} = live(conn, Routes.result_entry_index_path(conn, :index))

      assert index_live |> element("#result_entry-#{result_entry.id} a", "Edit") |> render_click() =~
               "Edit Result entry"

      assert_patch(index_live, Routes.result_entry_index_path(conn, :edit, result_entry))

      assert index_live
             |> form("#result_entry-form", result_entry: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#result_entry-form", result_entry: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.result_entry_index_path(conn, :index))

      assert html =~ "Result entry updated successfully"
    end

    test "deletes result_entry in listing", %{conn: conn, result_entry: result_entry} do
      {:ok, index_live, _html} = live(conn, Routes.result_entry_index_path(conn, :index))

      assert index_live |> element("#result_entry-#{result_entry.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#result_entry-#{result_entry.id}")
    end
  end

  describe "Show" do
    setup [:create_result_entry]

    test "displays result_entry", %{conn: conn, result_entry: result_entry} do
      {:ok, _show_live, html} = live(conn, Routes.result_entry_show_path(conn, :show, result_entry))

      assert html =~ "Show Result entry"
    end

    test "updates result_entry within modal", %{conn: conn, result_entry: result_entry} do
      {:ok, show_live, _html} = live(conn, Routes.result_entry_show_path(conn, :show, result_entry))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Result entry"

      assert_patch(show_live, Routes.result_entry_show_path(conn, :edit, result_entry))

      assert show_live
             |> form("#result_entry-form", result_entry: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#result_entry-form", result_entry: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.result_entry_show_path(conn, :show, result_entry))

      assert html =~ "Result entry updated successfully"
    end
  end
end
