defmodule Socialmarketvms.EventsTest do
  use Socialmarketvms.DataCase

  alias Socialmarketvms.Events

  describe "events" do
    alias Socialmarketvms.Events.Event

    import Socialmarketvms.EventsFixtures

    @invalid_attrs %{name: nil, date: nil, description: nil, location: nil, start_time: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{name: "some name", date: ~D[2025-02-18], description: "some description", location: "some location", start_time: ~T[14:00:00]}

      assert {:ok, %Event{} = event} = Events.create_event(valid_attrs)
      assert event.name == "some name"
      assert event.date == ~D[2025-02-18]
      assert event.description == "some description"
      assert event.location == "some location"
      assert event.start_time == ~T[14:00:00]
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{name: "some updated name", date: ~D[2025-02-19], description: "some updated description", location: "some updated location", start_time: ~T[15:01:01]}

      assert {:ok, %Event{} = event} = Events.update_event(event, update_attrs)
      assert event.name == "some updated name"
      assert event.date == ~D[2025-02-19]
      assert event.description == "some updated description"
      assert event.location == "some updated location"
      assert event.start_time == ~T[15:01:01]
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
