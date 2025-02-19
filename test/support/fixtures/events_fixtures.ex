defmodule Socialmarketvms.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Socialmarketvms.Events` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        date: ~D[2025-02-18],
        description: "some description",
        location: "some location",
        name: "some name",
        start_time: ~T[14:00:00]
      })
      |> Socialmarketvms.Events.create_event()

    event
  end
end
