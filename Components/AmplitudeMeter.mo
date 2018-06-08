within EmFieldSensor.Components;

model AmplitudeMeter

    parameter Real samplingFrequencyHz;
    
    constant Real adcReferenceVoltage = 1.25;

  Modelica.Blocks.Interfaces.RealInput voltage annotation(
    Placement(visible = true, transformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput field_strength annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EmFieldSensor.Components.Normalizer normalizer(maxOutput = adcReferenceVoltage, minOutput = -adcReferenceVoltage)  annotation(
    Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AnalogToInteger analogToInteger(maxVoltage = adcReferenceVoltage, minVoltage = -adcReferenceVoltage, resolutionInBits = 10)  annotation(
    Placement(visible = true, transformation(origin = {-4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Denormalizer denormalizer annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.IntegerToReal integerToReal1 annotation(
    Placement(visible = true, transformation(origin = {22, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Electrical.Digital.Sources.Pulse pulse1(nperiod = -1, period = 1.0 / samplingFrequencyHz, pulse = Modelica.Electrical.Digital.Interfaces.Logic.'1', quiet = Modelica.Electrical.Digital.Interfaces.Logic.'0', startTime = 0, width = 1)  annotation(
    Placement(visible = true, transformation(origin = {-36, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pulse1.y, analogToInteger.trigger) annotation(
    Line(points = {{-26, 36}, {-22, 36}, {-22, 6}, {-14, 6}, {-14, 6}, {-14, 6}}, color = {127, 0, 127}));
  connect(denormalizer.denormalized, field_strength) annotation(
    Line(points = {{60, 0}, {98, 0}, {98, 0}, {106, 0}}, color = {0, 0, 127}));
  connect(normalizer.gainApplied, denormalizer.gainUsedForNormalization) annotation(
    Line(points = {{-42, -2}, {-30, -2}, {-30, -22}, {34, -22}, {34, -4}, {40, -4}, {40, -4}, {40, -4}}, color = {0, 0, 127}));
  connect(integerToReal1.y, denormalizer.normalized) annotation(
    Line(points = {{28, 0}, {40, 0}, {40, 0}, {40, 0}}, color = {0, 0, 127}));
  connect(analogToInteger.integerOutput, integerToReal1.u) annotation(
    Line(points = {{6, 0}, {14, 0}, {14, 0}, {14, 0}}, color = {255, 127, 0}));
  connect(normalizer.normalized, analogToInteger.voltageToGround) annotation(
    Line(points = {{-42, 0}, {-16, 0}, {-16, 0}, {-14, 0}}, color = {0, 0, 127}));
  connect(voltage, normalizer.inputValue) annotation(
    Line(points = {{-106, 0}, {-64, 0}, {-64, 0}, {-62, 0}}, color = {0, 0, 127}));

    end AmplitudeMeter;