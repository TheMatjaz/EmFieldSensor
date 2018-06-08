within EmFieldSensor.Components;

model AmplitudeMeter

    parameter Real samplingFrequencyHz;

  Modelica.Blocks.Interfaces.RealInput voltage annotation(
    Placement(visible = true, transformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput field_strength annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.SampleTrigger sampleTrigger1(period = 1.0/samplingFrequencyHz, startTime = 0)  annotation(
    Placement(visible = true, transformation(origin = {-56, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EmFieldSensor.Components.Normalizer normalizer(maxOutput = 1.25, minOutput = -1.25)  annotation(
    Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AnalogToInteger analogToInteger(maxVoltage = -1.25, minVoltage = 1.25)  annotation(
    Placement(visible = true, transformation(origin = {-4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Denormalizer denormalizer annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.IntegerToReal integerToReal1 annotation(
    Placement(visible = true, transformation(origin = {22, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(integerToReal1.y, denormalizer.normalized) annotation(
    Line(points = {{28, 0}, {38, 0}, {38, 0}, {40, 0}}, color = {0, 0, 127}));
  connect(analogToInteger.integerOutput, integerToReal1.u) annotation(
    Line(points = {{6, 0}, {14, 0}, {14, 0}, {14, 0}}, color = {255, 127, 0}));
  connect(normalizer.gainApplied, denormalizer.gainUsedForNormalization) annotation(
    Line(points = {{-42, -2}, {-24, -2}, {-24, -20}, {32, -20}, {32, -4}, {40, -4}, {40, -4}}, color = {0, 0, 127}));
  connect(normalizer.normalized, analogToInteger.voltageToGround) annotation(
    Line(points = {{-42, 0}, {-14, 0}, {-14, 0}, {-14, 0}}, color = {0, 0, 127}));
  connect(voltage, normalizer.inputValue) annotation(
    Line(points = {{-106, 0}, {-64, 0}, {-64, 0}, {-62, 0}}, color = {0, 0, 127}));
  connect(denormalizer.denormalized, field_strength) annotation(
    Line(points = {{60, 0}, {98, 0}, {98, 0}, {106, 0}}, color = {0, 0, 127}));
  connect(analogToInteger.value, denormalizer.normalized) annotation(
    Line(points = {{6, 0}, {36, 0}, {36, 0}, {40, 0}}, color = {255, 127, 0}));
  connect(sampleTrigger1.y, analogToInteger.trigger) annotation(
    Line(points = {{-44, 48}, {-14, 48}, {-14, 6}, {-14, 6}}, color = {255, 0, 255}));
  connect(normalizer.normalizedVoltage, analogToInteger.voltageToGround) annotation(
    Line(points = {{-42, 0}, {-14, 0}, {-14, 0}, {-14, 0}}, color = {0, 0, 127}));
  connect(voltage, normalizer.voltage) annotation(
    Line(points = {{-106, 0}, {-64, 0}, {-64, 0}, {-62, 0}}, color = {0, 0, 127}));
    end AmplitudeMeter;