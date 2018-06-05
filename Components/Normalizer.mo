within EmFieldSensor.Components;

model Normalizer

    Modelica.Blocks.Interfaces.RealInput inputValue annotation(
    Placement(visible = true, transformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput normalized annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput gainApplied annotation(
    Placement(visible = true, transformation(origin = {106, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
    parameter Real maxOutput;
    parameter Real minOutput;

equation
    normalized = (inputValue - minOutput) / (maxOutput - maxOutput);
    gainApplied = normalized/inputValue;
    
end Normalizer;