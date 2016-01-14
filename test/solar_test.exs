defmodule SolarTest do
  use ExUnit.Case
  use Timex
  import Solar.Flare

  setup do
    flares =  [
      %Solar.Flare{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
      %Solar.Flare{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
      %Solar.Flare{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
      %Solar.Flare{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
      %Solar.Flare{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %Solar.Flare{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
      %Solar.Flare{classification: :X, scale: 72, date: Date.from({2015, 7,23})},
      %Solar.Flare{classification: :X, scale: 45, date: Date.from({2015, 11, 4})},
    ]
    {:ok, data: flares}
  end

  test "Load flares to set scale and power", %{data: flares} do
    loaded = load(flares)
    loaded_comprehension = load_flares_comp(flares)

    rhs = [
      %Solar.Flare{classification: :X, scale: 99, power: 99000, is_deadly: true, date: Date.from({1859, 8, 29})},
      %Solar.Flare{classification: :M, scale: 5.8, power: 58, is_deadly: false, date: Date.from({2015, 1, 12})},
      %Solar.Flare{classification: :M, scale: 1.2, power: 12, is_deadly: false, date: Date.from({2015, 2, 9})},
      %Solar.Flare{classification: :C, scale: 3.2, power: 3.2, is_deadly: false, date: Date.from({2015, 4, 18})},
      %Solar.Flare{classification: :M, scale: 83.6, power: 836, is_deadly: false, date: Date.from({2015, 6, 23})},
      %Solar.Flare{classification: :C, scale: 2.5, power: 2.5, is_deadly: false, date: Date.from({2015, 7, 4})},
      %Solar.Flare{classification: :X, scale: 72, power: 72000, is_deadly: true, date: Date.from({2015, 7,23})},
      %Solar.Flare{classification: :X, scale: 45, power: 45000, is_deadly: true, date: Date.from({2015, 11, 4})},
    ]

    assert loaded == rhs
    assert loaded_comprehension == rhs
  end

  test "A Solar Flare is a Map with a special key" do
    assert %Solar.Flare{}.__struct__ == Solar.Flare
  end

  test "flare list", %{data: flares} do
    should_be = [
      %{power: 99000, is_deadly: true},
      %{power: 58.0, is_deadly: false},
      %{power: 12.0, is_deadly: false},
      %{power: 3.2, is_deadly: false},
      %{power: 836.0, is_deadly: false},
      %{power: 2.5, is_deadly: false},
      %{power: 72000, is_deadly: true},
      %{power: 45000, is_deadly: true}]
    assert flare_list(flares) == should_be
  end

  test "go inside", %{data: flares} do
    assert length(no_eva(flares)) == 3
  end

  test "deadliest", %{data: flares} do
    assert deadliest(flares) == 99000
  end

  test "we have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end



  test "power for X" do
    assert calculate_power(
    %Solar.Flare{classification: :X, scale: 99, date: Date.from({1859, 8, 29})}
                ) ==     %Solar.Flare{classification: :X, scale: 99, date: Date.from({1859, 8, 29}), power: 99000}
  end
end
