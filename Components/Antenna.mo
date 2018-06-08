within EmFieldSensor.Components;

model Antenna

    parameter Real resonantFrequencyHz = 125000;

  Modelica.Blocks.Interfaces.RealInput field annotation(
    Placement(visible = true, transformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput voltage annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(field, voltage) annotation(
    Line(points = {{-108, 0}, {98, 0}, {98, 0}, {106, 0}}, color = {0, 0, 127}));
end Antenna;