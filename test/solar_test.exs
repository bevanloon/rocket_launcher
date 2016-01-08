defmodule SolarTest do
  use ExUnit.Case
  use Timex
  import Solar

  setup do
    flares =  [
      %{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
      %{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
      %{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
      %{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
      %{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
      %{classification: :X, scale: 72, date: Date.from({2015, 7,23})},
      %{classification: :X, scale: 45, date: Date.from({2015, 11, 4})},
    ]
    {:ok, data: flares}
  end
  test "anonymous function total flare power", %{data: flares} do
      assert anon_total_flare_power(flares, 0, fn(flare, acc) -> power(flare) + acc end) == 216911.7
    end

  test "roll your own reduce", %{data: flares} do
    assert reduce_flare_power(flares, 0, fn(flare, acc) -> power(flare) + acc end) == 216911.7
  end

  test "sum powers on empty list" do
    assert total_flare_power([], 5) == 5
  end

  test "sum powers on flare" do
    # X is 1000, scale is 99 so power for this one must be 99000
    assert total_flare_power([%{classification: :X, scale: 99, date: Date.from({1859, 8, 29})}], 0) == 99000
  end

  test "sum powers on all flares", %{data: flares} do
    assert total_flare_power(flares) == 216911.7
  end

  test "enum sum eva", %{data: flares} do
    assert enum_total_flare_power(flares) == 216911.7
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
    assert power( %{classification: :X,
                    scale: 99,
                    date: Date.from({1859, 8, 29})}
                ) == 99000
  end

  test "power for M" do
    assert power( %{classification: :M,
                    scale: 99,
                    date: Date.from({1859, 8, 29})}
                ) == 990
  end

  test "power for C" do
    assert power( %{classification: :C,
                    scale: 99,
                    date: Date.from({1859, 8, 29})}
                ) == 99
  end

end
