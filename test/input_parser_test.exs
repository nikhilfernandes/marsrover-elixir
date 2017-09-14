alias MarsRover.InputParser

defmodule MarsRover.InputParserTest do
  use ExUnit.Case, async: true

  describe "InputParser.parse" do
    test "well formed file", context do
      {:ok, input} = File.read("test/support/input.txt")
      assert InputParser.process(input) == {%MarsRover.Plateau{maxX: 5, maxY: 5}, %MarsRover.Rover{current_position: %MarsRover.Position{xPos: 1, yPos: 2, direction: "N"}, instructions: "LMLMLMLMM", remaining_instructions: "LMLMLMLMM"}}
    end
  end

end
