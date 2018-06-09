within EmFieldSensor.Components;

model FrequencySpectrum
  Modelica.Blocks.Sources.Sine sine1(amplitude = 1, freqHz = 125000, phase = 0)  annotation(
    Placement(visible = true, transformation(origin = {-78, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine2(amplitude = 0.26, freqHz = 200000, phase = 2.00713)  annotation(
    Placement(visible = true, transformation(origin = {-78, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine3(amplitude = 0.2, freqHz = 140000, phase = 0.767945)  annotation(
    Placement(visible = true, transformation(origin = {-78, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine4(amplitude = 0.15, freqHz = 50, phase = 1.5708)  annotation(
    Placement(visible = true, transformation(origin = {-78, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine5(amplitude = 0.2, freqHz = 1e8, phase = 0.0872665)  annotation(
    Placement(visible = true, transformation(origin = {-78, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum signalSum(nin = 5)  annotation(
    Placement(visible = true, transformation(origin = {22, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput signals annotation(
    Placement(visible = true, transformation(origin = {108, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput wantedSignal annotation(
    Placement(visible = true, transformation(origin = {106, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sine1.y, wantedSignal) annotation(
    Line(points = {{-66, 66}, {106, 66}}, color = {0, 0, 127}));
  connect(signalSum.y, signals) annotation(
    Line(points = {{34, -4}, {108, -4}}, color = {0, 0, 127}));
  connect(sine5.y, signalSum.u[5]) annotation(
    Line(points = {{-66, -70}, {2, -70}, {2, -4}, {10, -4}}, color = {0, 0, 127}));
  connect(sine4.y, signalSum.u[4]) annotation(
    Line(points = {{-66, -36}, {2, -36}, {2, -4}, {10, -4}}, color = {0, 0, 127}));
  connect(sine3.y, signalSum.u[3]) annotation(
    Line(points = {{-66, -4}, {10, -4}}, color = {0, 0, 127}));
  connect(sine1.y, signalSum.u[1]) annotation(
    Line(points = {{-66, 66}, {2, 66}, {2, -4}, {10, -4}}, color = {0, 0, 127}));
  connect(sine2.y, signalSum.u[2]) annotation(
    Line(points = {{-66, 32}, {2, 32}, {2, -4}, {10, -4}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 2e-5, Tolerance = 1e-06, Interval = 2e-07));end FrequencySpectrum;