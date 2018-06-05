within EmFieldSensor;

model Sensor
  Components.Antenna RxAntenna(resonantFrequencyHz = 125000)  annotation(
    Placement(visible = true, transformation(origin = {-42, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.AmplitudeMeter amplitudeMeter(samplingFrequencyHz = 125000 * 10)  annotation(
    Placement(visible = true, transformation(origin = {4, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EmFieldSensor.Components.Spectrum spectrum1 annotation(
    Placement(visible = true, transformation(origin = {-82, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(spectrum1.signals, RxAntenna.field) annotation(
    Line(points = {{-72, 2}, {-54, 2}, {-54, 2}, {-52, 2}}, color = {0, 0, 127}));
  connect(RxAntenna.voltage, amplitudeMeter.voltage) annotation(
    Line(points = {{-32, 2}, {-8, 2}, {-8, 2}, {-6, 2}}, color = {0, 0, 127}));

end Sensor;