defmodule Calcs do
  def nearest_tenth(num) do
    Float.ceil(num, 1)
  end

  def to_km(num) do
    num / 1000
  end
end
