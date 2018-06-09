within EmFieldSensor;

model Sensor

    parameter Real frequency = 125000;
    parameter Real samplesPerPeriod = 10;

  Components.Antenna RxAntenna(resonantFrequencyHz = frequency)  annotation(
    Placement(visible = true, transformation(origin = {-42, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.AmplitudeMeter amplitudeMeter(adcReferenceVoltage = 1, inputFrequencyHz = frequency, sampleResolutionInBits = 3, samplesPerPeriod = samplesPerPeriod)  annotation(
    Placement(visible = true, transformation(origin = {4, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(freqHz = frequency)  annotation(
    Placement(visible = true, transformation(origin = {-82, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput fieldAmplitude annotation(
    Placement(visible = true, transformation(origin = {52, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {52, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sampledField annotation(
    Placement(visible = true, transformation(origin = {52, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {52, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(amplitudeMeter.sampledField, sampledField) annotation(
    Line(points = {{14, 4}, {28, 4}, {28, 22}, {46, 22}, {46, 24}, {52, 24}}, color = {0, 0, 127}));
  connect(amplitudeMeter.amplitude, fieldAmplitude) annotation(
    Line(points = {{14, 2}, {52, 2}}, color = {0, 0, 127}));
  connect(sine1.y, RxAntenna.field) annotation(
    Line(points = {{-70, 2}, {-54, 2}, {-54, 2}, {-52, 2}}, color = {0, 0, 127}));
  connect(RxAntenna.voltage, amplitudeMeter.voltage) annotation(
    Line(points = {{-32, 2}, {-8, 2}, {-8, 2}, {-6, 2}}, color = {0, 0, 127}));
end Sensor;