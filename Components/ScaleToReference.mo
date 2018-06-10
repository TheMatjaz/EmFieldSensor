within EmFieldSensor.Components;

model ScaleToReference

  parameter Real adcMaxVoltage;
  parameter Real resolutionInBits;
  
  inner Real amplitude;
  
  Modelica.Blocks.Interfaces.RealInput adcValue annotation(
    Placement(visible = true, transformation(origin = {-118, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-118, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput scaled annotation(
    Placement(visible = true, transformation(origin = {112, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {112, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
equation
    amplitude = adcValue * 3.14159265359 / 2.0;
    scaled = amplitude / (2^resolutionInBits - 1) * adcMaxVoltage;
    
end ScaleToReference;