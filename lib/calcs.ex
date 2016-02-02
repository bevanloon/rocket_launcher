defmodule Calcs do
  def nearest_tenth(num) do
    Float.ceil(num, 1)
  end

  def to_km(num) do
    num / 1000
  end

  def to_m(val) do
    val * 1000
  end

  def square_root(val) do
    :math.sqrt(val)
  end

  def cube_root(val) do
    :math.pow(val, 1/3)
  end

  def squared(val) do
    val * val
  end

  def cubed(val) do
    val * val * val
  end

  def seconds_to_hours(val) do
    val / 3600 |> nearest_tenth
  end
  
  def hours_to_seconds(val) do
    (val * 3600.00) |> nearest_tenth
  end
end
