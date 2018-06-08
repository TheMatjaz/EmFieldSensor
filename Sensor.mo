within EmFieldSensor;

model Sensor

    parameter Real frequency = 125000;
    parameter Real samplesPerPeriod = 10;

  Components.Antenna RxAntenna(resonantFrequencyHz = frequency)  annotation(
    Placement(visible = true, transformation(origin = {-42, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.AmplitudeMeter amplitudeMeter(samplingFrequencyHz = frequency * samplesPerPeriod)  annotation(
    Placement(visible = true, transformation(origin = {4, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(freqHz = frequency)  annotation(
    Placement(visible = true, transformation(origin = {-82, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput measuredFieldStrength annotation(
    Placement(visible = true, transformation(origin = {52, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {52, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(amplitudeMeter.field_strength, measuredFieldStrength) annotation(
    Line(points = {{14, 2}, {52, 2}}, color = {0, 0, 127}));
  connect(sine1.y, RxAntenna.field) annotation(
    Line(points = {{-70, 2}, {-54, 2}, {-54, 2}, {-52, 2}}, color = {0, 0, 127}));
  connect(RxAntenna.voltage, amplitudeMeter.voltage) annotation(
    Line(points = {{-32, 2}, {-8, 2}, {-8, 2}, {-6, 2}}, color = {0, 0, 127}));
end Sensor;