within EmFieldSensor.Components;

model Normalizer

    Modelica.Blocks.Interfaces.RealInput voltage annotation(
    Placement(visible = true, transformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput normalizedVoltage annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput gainApplied annotation(
    Placement(visible = true, transformation(origin = {106, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
    parameter Real maxVoltageOutput;
    parameter Real minVoltageOutput;

equation
    normalizedVoltage = (voltage-minVoltageOutput)/(maxVoltageOutput-minVoltageOutput);
    gain = normalizedVoltage/voltage;

end Normalizer;