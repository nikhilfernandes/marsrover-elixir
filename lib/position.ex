defmodule MarsRover.Position do
  defstruct xPos: Integer, yPos: nil, direction: nil

  def new_position(%MarsRover.Position{} = position, "L") do
    case position.direction do
      "N" -> %MarsRover.Position{position | direction: "W"}
      "S" -> %MarsRover.Position{position | direction: "E"}
      "E" -> %MarsRover.Position{position | direction: "N"}
      "W" -> %MarsRover.Position{position | direction: "S"}
    end
  end

  def new_position(%MarsRover.Position{} = position, "R") do
    case position.direction do
      "N" -> %MarsRover.Position{position | direction: "E"}
      "S" -> %MarsRover.Position{position | direction: "W"}
      "E" -> %MarsRover.Position{position | direction: "S"}
      "W" -> %MarsRover.Position{position | direction: "N"}
    end
  end

  def new_position(%MarsRover.Position{} = position, "M") do
    case position.direction do
      "N" -> %MarsRover.Position{position | yPos: position.yPos+1}
      "S" -> %MarsRover.Position{position | yPos: position.yPos-1}
      "E" -> %MarsRover.Position{position | xPos: position.xPos+1}
      "W" -> %MarsRover.Position{position | xPos: position.xPos-1}
    end
  end

  defimpl String.Chars, for: MarsRover.Position do
    def to_string(position) do
      "#{position.xPos} #{position.yPos} #{position.direction}"
    end
  end

end
