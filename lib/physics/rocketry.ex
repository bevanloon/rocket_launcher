defmodule Physics.Rocketry do
  import Calcs
  import Planet
  import Laws

  @earth Planet.select[:earth]

  def orbital_speed(height) do
    orbital_speed(height, @earth)
  end

  def orbital_speed(height,  %{mass: mass, radius: radius}) do
   (newtons_gravitational_constant * mass  /
      orbital_radius(height, radius))
    |> square_root
  end

  def orbital_acceleration(height) do
    orbital_acceleration(height, @earth)
  end

  def orbital_acceleration(height, %{mass: mass, radius: radius}) do
    (orbital_speed(height, %{mass: mass, radius: radius}) |> squared) /
      orbital_radius(height, radius)
  end

  def orbital_term(height) do
    orbital_term(height, @earth)
  end

  def orbital_term(height, %{mass: mass, radius: radius}) do
    4 * (:math.pi |> squared) *
        (orbital_radius(height, radius) |> cubed) /
        (newtons_gravitational_constant
          * mass)
      |> square_root
      |> seconds_to_hours
  end

  def height_for_orbital_term(term, %{mass: mass, radius: radius}) do
      (newtons_gravitational_constant *
        mass *
        (term |> seconds_to_hours |> squared)  /
        (4 * (:math.pi |> squared)))
        |> cube_root
        |> height_sans_orbital_radius(radius)
        |> to_km
  end

  defp height_sans_orbital_radius(height, radius) do
    radius - height
  end

  defp orbital_radius(height, radius) do
    radius + (height |> to_m)
  end

end
