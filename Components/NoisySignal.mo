within EmFieldSensor.Components;

model NoisySignal

  parameter Real signalAmplitude = 1;
  parameter Real noiseAmplitude = 0.1;
  parameter Real frequency = 125000;

  Modelica.Blocks.Sources.Sine signal(amplitude = signalAmplitude, freqHz = frequency, phase = 0)  annotation(
    Placement(visible = true, transformation(origin = {-78, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum signalSum(nin = 2)  annotation(
    Placement(visible = true, transformation(origin = {22, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput signalAndNoise annotation(
    Placement(visible = true, transformation(origin = {108, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput signalOnly annotation(
    Placement(visible = true, transformation(origin = {106, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Blocks.Noise.UniformNoise uniformNoise1(enableNoise = true,samplePeriod = 1 / frequency / 47, useAutomaticLocalSeed = false, useGlobalSeed = true, y_max = noiseAmplitude, y_min = -noiseAmplitude)  annotation(
    Placement(visible = true, transformation(origin = {-76, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(enableNoise = true)  annotation(
    Placement(visible = true, transformation(origin = {-76, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(signalSum.y, signalAndNoise) annotation(
    Line(points = {{34, -4}, {98, -4}, {98, -4}, {108, -4}}, color = {0, 0, 127}));
  connect(uniformNoise1.y, signalSum.u[2]) annotation(
    Line(points = {{-64, -4}, {10, -4}, {10, -4}, {10, -4}}, color = {0, 0, 127}));
  connect(signal.y, signalSum.u[1]) annotation(
    Line(points = {{-66, 66}, {-22, 66}, {-22, -4}, {10, -4}, {10, -4}}, color = {0, 0, 127}));
  connect(signal.y, signalOnly) annotation(
    Line(points = {{-66, 66}, {98, 66}, {98, 66}, {106, 66}}, color = {0, 0, 127}));    end NoisySignal;