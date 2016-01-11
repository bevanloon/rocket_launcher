defmodule SolarMultiMapReduce do

  def power(%{classification: :X, scale: s}) do
    power(1000, s)
  end

  def power(%{classification: :M, scale: s}) do
    power(10, s)
  end

  def power(%{classification: :C, scale: s}) do
    power(1, s)
  end

  def no_eva(flares) do
    Enum.filter flares, fn  (flare) ->
      power(flare) > 1000
    end
  end

  def deadliest(flares) do
    Enum.map(flares, &(power(&1)))
      |> Enum.max
  end

  def for_total_flare_power(flares) do
    (for flare <- flares, do: power(flare))
      |> Enum.sum
  end

  def anon_total_flare_power([head|tail], acc, fun) do
    tail
      |> anon_total_flare_power fun.(head, acc), fun
  end

  def anon_total_flare_power([], acc, fun) do
    acc
  end




  def enum_total_flare_power(flares) do
    Enum.map(flares, &(power(&1)))
    |> Enum.sum
  end

  def total_flare_power(flares) do
    total_flare_power(flares, 0)
  end

  def total_flare_power([head|tail], sum_of_powers) do
    total_flare_power(tail, sum_of_powers + power(head))
  end

  def total_flare_power([], sum_of_powers) do
    sum_of_powers
  end

  defp power(classification, scale) do
    classification * scale
  end
end
