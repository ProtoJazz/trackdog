defmodule Trackdog.EventsTest do
  use Trackdog.DataCase

  alias Trackdog.Events

  describe "results" do
    alias Trackdog.Events.Result

    @valid_attrs %{event_id: 42, result_entries: 42}
    @update_attrs %{event_id: 43, result_entries: 43}
    @invalid_attrs %{event_id: nil, result_entries: nil}

    def result_fixture(attrs \\ %{}) do
      {:ok, result} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_result()

      result
    end

    test "list_results/0 returns all results" do
      result = result_fixture()
      assert Events.list_results() == [result]
    end

    test "get_result!/1 returns the result with given id" do
      result = result_fixture()
      assert Events.get_result!(result.id) == result
    end

    test "create_result/1 with valid data creates a result" do
      assert {:ok, %Result{} = result} = Events.create_result(@valid_attrs)
      assert result.event_id == 42
      assert result.result_entries == 42
    end

    test "create_result/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_result(@invalid_attrs)
    end

    test "update_result/2 with valid data updates the result" do
      result = result_fixture()
      assert {:ok, %Result{} = result} = Events.update_result(result, @update_attrs)
      assert result.event_id == 43
      assert result.result_entries == 43
    end

    test "update_result/2 with invalid data returns error changeset" do
      result = result_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_result(result, @invalid_attrs)
      assert result == Events.get_result!(result.id)
    end

    test "delete_result/1 deletes the result" do
      result = result_fixture()
      assert {:ok, %Result{}} = Events.delete_result(result)
      assert_raise Ecto.NoResultsError, fn -> Events.get_result!(result.id) end
    end

    test "change_result/1 returns a result changeset" do
      result = result_fixture()
      assert %Ecto.Changeset{} = Events.change_result(result)
    end
  end

  describe "result_entries" do
    alias Trackdog.Events.ResultEntry

    @valid_attrs %{driver: 42, finish: 42, points: 42, result: 42, start: 42}
    @update_attrs %{driver: 43, finish: 43, points: 43, result: 43, start: 43}
    @invalid_attrs %{driver: nil, finish: nil, points: nil, result: nil, start: nil}

    def result_entry_fixture(attrs \\ %{}) do
      {:ok, result_entry} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_result_entry()

      result_entry
    end

    test "list_result_entries/0 returns all result_entries" do
      result_entry = result_entry_fixture()
      assert Events.list_result_entries() == [result_entry]
    end

    test "get_result_entry!/1 returns the result_entry with given id" do
      result_entry = result_entry_fixture()
      assert Events.get_result_entry!(result_entry.id) == result_entry
    end

    test "create_result_entry/1 with valid data creates a result_entry" do
      assert {:ok, %ResultEntry{} = result_entry} = Events.create_result_entry(@valid_attrs)
      assert result_entry.driver == 42
      assert result_entry.finish == 42
      assert result_entry.points == 42
      assert result_entry.result == 42
      assert result_entry.start == 42
    end

    test "create_result_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_result_entry(@invalid_attrs)
    end

    test "update_result_entry/2 with valid data updates the result_entry" do
      result_entry = result_entry_fixture()
      assert {:ok, %ResultEntry{} = result_entry} = Events.update_result_entry(result_entry, @update_attrs)
      assert result_entry.driver == 43
      assert result_entry.finish == 43
      assert result_entry.points == 43
      assert result_entry.result == 43
      assert result_entry.start == 43
    end

    test "update_result_entry/2 with invalid data returns error changeset" do
      result_entry = result_entry_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_result_entry(result_entry, @invalid_attrs)
      assert result_entry == Events.get_result_entry!(result_entry.id)
    end

    test "delete_result_entry/1 deletes the result_entry" do
      result_entry = result_entry_fixture()
      assert {:ok, %ResultEntry{}} = Events.delete_result_entry(result_entry)
      assert_raise Ecto.NoResultsError, fn -> Events.get_result_entry!(result_entry.id) end
    end

    test "change_result_entry/1 returns a result_entry changeset" do
      result_entry = result_entry_fixture()
      assert %Ecto.Changeset{} = Events.change_result_entry(result_entry)
    end
  end

  describe "events" do
    alias Trackdog.Events.Event

    @valid_attrs %{date: "2010-04-17T14:00:00Z", result: 42, track: "some track"}
    @update_attrs %{date: "2011-05-18T15:01:01Z", result: 43, track: "some updated track"}
    @invalid_attrs %{date: nil, result: nil, track: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert event.result == 42
      assert event.track == "some track"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Events.update_event(event, @update_attrs)
      assert event.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert event.result == 43
      assert event.track == "some updated track"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
