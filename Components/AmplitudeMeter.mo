within EmFieldSensor.Components;

model AmplitudeMeter

  Modelica.Blocks.Interfaces.RealInput voltage annotation(
    Placement(visible = true, transformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput field_strength annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.SampleTrigger sampleTrigger1(period = 10 / 125000, startTime = 0)  annotation(
    Placement(visible = true, transformation(origin = {-56, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  adc ADC annotation(
    Placement(visible = true, transformation(origin = {-16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ADC.value, field_strength) annotation(
    Line(points = {{-6, 0}, {98, 0}, {98, 0}, {106, 0}}, color = {255, 127, 0}));
  connect(sampleTrigger1.y, ADC.value) annotation(
    Line(points = {{-44, 48}, {-26, 48}, {-26, 0}, {-6, 0}, {-6, 0}}, color = {255, 0, 255}));
  connect(voltage, ADC.voltageToGround) annotation(
    Line(points = {{-106, 0}, {-26, 0}, {-26, 0}, {-26, 0}}, color = {0, 0, 127}));
end AmplitudeMeter;