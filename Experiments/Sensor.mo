within EmFieldSensor.Experiments;

model Sensor
  Components.NoisySignal noisySignal1(noiseAmplitude = 0.4, signalAmplitude = 2)  annotation(
    Placement(visible = true, transformation(origin = {-66, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Antenna antenna1 annotation(
    Placement(visible = true, transformation(origin = {-28, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EmFieldSensor.Components.AmplitudeMeter amplitudeMeter1(adcMaxVoltage = 3.3, inputFrequencyHz = 125000, sampleResolutionInBits = 3, samplesPerPeriod = 10)  annotation(
    Placement(visible = true, transformation(origin = {14, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput fieldAmplitude annotation(
    Placement(visible = true, transformation(origin = {104, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sampledField annotation(
    Placement(visible = true, transformation(origin = {102, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(amplitudeMeter1.sampledField, sampledField) annotation(
    Line(points = {{24, 8}, {58, 8}, {58, 44}, {102, 44}, {102, 44}}, color = {0, 0, 127}));
  connect(amplitudeMeter1.amplitude, fieldAmplitude) annotation(
    Line(points = {{24, 6}, {98, 6}, {98, 6}, {104, 6}}, color = {0, 0, 127}));
  connect(antenna1.voltage, amplitudeMeter1.voltage) annotation(
    Line(points = {{-18, 6}, {0, 6}, {0, 6}, {2, 6}}, color = {0, 0, 127}));
  connect(noisySignal1.signalAndNoise, antenna1.field) annotation(
    Line(points = {{-56, 6}, {-40, 6}, {-40, 6}, {-38, 6}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 3e-05, Tolerance = 1e-06, Interval = 1.5e-07));
end Sensor;