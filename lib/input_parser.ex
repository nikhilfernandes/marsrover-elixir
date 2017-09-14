defmodule MarsRover.InputParser do

  def process(input) do
    [plateau_coordinates, rover_position, instructions, _garbage] = String.split(input, "\n")
    {parse_plateau_coordinates(plateau_coordinates),%MarsRover.Rover{current_position: parse_rover_position(rover_position), instructions: instructions, remaining_instructions: instructions}}
  end

  def parse_plateau_coordinates(plateau_coordinates) do
    [maxX, maxY] = String.split(plateau_coordinates, " ")
    {maxXAsInt, _} = Integer.parse(maxX)
    {maxYAsInt, _} = Integer.parse(maxY)
    %MarsRover.Plateau{maxX: maxYAsInt, maxY: maxYAsInt}
  end

  def parse_rover_position(rover_position) do
    [x, y, dir] = String.split(rover_position, " ")
    {xAsInt, _} = Integer.parse(x)
    {yAsInt, _} = Integer.parse(y)
    %MarsRover.Position{xPos: xAsInt, yPos: yAsInt, direction: dir}
  end
end
