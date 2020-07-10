defmodule TrackdogWeb.MemberLiveTest do
  use TrackdogWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Trackdog.Members

  @create_attrs %{results: 42}
  @update_attrs %{results: 43}
  @invalid_attrs %{results: nil}

  defp fixture(:member) do
    {:ok, member} = Members.create_member(@create_attrs)
    member
  end

  defp create_member(_) do
    member = fixture(:member)
    %{member: member}
  end

  describe "Index" do
    setup [:create_member]

    test "lists all members", %{conn: conn, member: member} do
      {:ok, _index_live, html} = live(conn, Routes.member_index_path(conn, :index))

      assert html =~ "Listing Members"
    end

    test "saves new member", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.member_index_path(conn, :index))

      assert index_live |> element("a", "New Member") |> render_click() =~
               "New Member"

      assert_patch(index_live, Routes.member_index_path(conn, :new))

      assert index_live
             |> form("#member-form", member: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#member-form", member: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.member_index_path(conn, :index))

      assert html =~ "Member created successfully"
    end

    test "updates member in listing", %{conn: conn, member: member} do
      {:ok, index_live, _html} = live(conn, Routes.member_index_path(conn, :index))

      assert index_live |> element("#member-#{member.id} a", "Edit") |> render_click() =~
               "Edit Member"

      assert_patch(index_live, Routes.member_index_path(conn, :edit, member))

      assert index_live
             |> form("#member-form", member: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#member-form", member: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.member_index_path(conn, :index))

      assert html =~ "Member updated successfully"
    end

    test "deletes member in listing", %{conn: conn, member: member} do
      {:ok, index_live, _html} = live(conn, Routes.member_index_path(conn, :index))

      assert index_live |> element("#member-#{member.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#member-#{member.id}")
    end
  end

  describe "Show" do
    setup [:create_member]

    test "displays member", %{conn: conn, member: member} do
      {:ok, _show_live, html} = live(conn, Routes.member_show_path(conn, :show, member))

      assert html =~ "Show Member"
    end

    test "updates member within modal", %{conn: conn, member: member} do
      {:ok, show_live, _html} = live(conn, Routes.member_show_path(conn, :show, member))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Member"

      assert_patch(show_live, Routes.member_show_path(conn, :edit, member))

      assert show_live
             |> form("#member-form", member: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#member-form", member: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.member_show_path(conn, :show, member))

      assert html =~ "Member updated successfully"
    end
  end
end
