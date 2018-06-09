within EmFieldSensor.Components;

model ScaleToReference

  parameter Real referenceVoltage;
  parameter Real resolutionInBits;

  Modelica.Blocks.Interfaces.RealInput adcValue annotation(
    Placement(visible = true, transformation(origin = {-118, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-118, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput scaled annotation(
    Placement(visible = true, transformation(origin = {112, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {112, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
equation
    scaled = adcValue / (2^resolutionInBits - 1) * 2*referenceVoltage;
    
end ScaleToReference;