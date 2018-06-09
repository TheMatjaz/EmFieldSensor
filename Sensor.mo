within EmFieldSensor;

model Sensor
  parameter Real frequency = 125000;
  parameter Real samplesPerPeriod = 25;
  parameter Integer sampleResolutionInBits = 10;
  parameter Real adcReferenceVoltage = 1.5;
  Components.Antenna RxAntenna(resonantFrequencyHz = frequency) annotation(
    Placement(visible = true, transformation(origin = {-42, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.AmplitudeMeter amplitudeMeter(adcReferenceVoltage = adcReferenceVoltage, inputFrequencyHz = frequency, sampleResolutionInBits = sampleResolutionInBits, samplesPerPeriod = samplesPerPeriod) annotation(
    Placement(visible = true, transformation(origin = {4, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput fieldAmplitude annotation(
    Placement(visible = true, transformation(origin = {52, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {52, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sampledField annotation(
    Placement(visible = true, transformation(origin = {52, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {52, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EmFieldSensor.Components.FrequencySpectrum frequencySpectrum1 annotation(
    Placement(visible = true, transformation(origin = {-82, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(frequencySpectrum1.signals, RxAntenna.field) annotation(
    Line(points = {{-71, 2}, {-52, 2}}, color = {0, 0, 127}));
  connect(amplitudeMeter.sampledField, sampledField) annotation(
    Line(points = {{14, 4}, {28, 4}, {28, 22}, {46, 22}, {46, 24}, {52, 24}}, color = {0, 0, 127}));
  connect(amplitudeMeter.amplitude, fieldAmplitude) annotation(
    Line(points = {{14, 2}, {52, 2}}, color = {0, 0, 127}));
  connect(RxAntenna.voltage, amplitudeMeter.voltage) annotation(
    Line(points = {{-32, 2}, {-8, 2}, {-8, 2}, {-6, 2}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 3.5e-05, Tolerance = 1e-06, Interval = 3.5e-07));
end Sensor;