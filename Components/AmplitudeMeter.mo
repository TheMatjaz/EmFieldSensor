within EmFieldSensor.Components;

model AmplitudeMeter
    
    parameter Real inputFrequencyHz;
    
    parameter Real samplesPerPeriod;
    
    parameter Real adcMaxVoltage = 1;
    
    parameter Integer sampleResolutionInBits = 10;

  Modelica.Blocks.Interfaces.RealInput voltage annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput amplitude annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EmFieldSensor.Components.AnalogToInteger analogToInteger(adcMaxVoltage = adcMaxVoltage, resolutionInBits = sampleResolutionInBits)  annotation(
    Placement(visible = true, transformation(origin = {-44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.IntegerToReal integerToReal1 annotation(
    Placement(visible = true, transformation(origin = {-18, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Electrical.Digital.Sources.Pulse pulse1(nperiod = -1, period = 1.0 / (inputFrequencyHz*samplesPerPeriod), pulse = Modelica.Electrical.Digital.Interfaces.Logic.'1', quiet = Modelica.Electrical.Digital.Interfaces.Logic.'0', startTime = 0, width = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sampledField annotation(
    Placement(visible = true, transformation(origin = {106, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EmFieldSensor.Components.ScaleToReference scaleToReference1(adcMaxVoltage = adcMaxVoltage, resolutionInBits = sampleResolutionInBits)  annotation(
    Placement(visible = true, transformation(origin = {64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation(
    Placement(visible = true, transformation(origin = {-76, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Mean mean1(f = inputFrequencyHz * 2)  annotation(
    Placement(visible = true, transformation(origin = {28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(mean1.y, scaleToReference1.adcValue) annotation(
    Line(points = {{39, 0}, {52, 0}}, color = {0, 0, 127}));
  connect(scaleToReference1.scaled, amplitude) annotation(
    Line(points = {{75, 0}, {106, 0}}, color = {0, 0, 127}));
  connect(integerToReal1.y, mean1.u) annotation(
    Line(points = {{-12, 0}, {16, 0}, {16, 0}, {16, 0}}, color = {0, 0, 127}));
  connect(abs1.y, analogToInteger.voltageToGround) annotation(
    Line(points = {{-64, 0}, {-54, 0}, {-54, 0}, {-54, 0}}, color = {0, 0, 127}));
  connect(voltage, abs1.u) annotation(
    Line(points = {{-120, 0}, {-88, 0}, {-88, 0}, {-88, 0}}, color = {0, 0, 127}));
  connect(pulse1.y, analogToInteger.trigger) annotation(
    Line(points = {{-80, 36}, {-62, 36}, {-62, 6}, {-54, 6}}, color = {127, 0, 127}));
  connect(analogToInteger.integerOutput, integerToReal1.u) annotation(
    Line(points = {{-33.4, 0}, {-27.4, 0}, {-27.4, 0}, {-25.4, 0}}, color = {255, 127, 0}));
  connect(integerToReal1.y, sampledField) annotation(
    Line(points = {{-11, 0}, {0, 0}, {0, 28}, {106, 28}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = -5e-06, StopTime = 2.5e-05, Tolerance = 1e-06, Interval = 1.5e-07));end AmplitudeMeter;