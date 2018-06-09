within EmFieldSensor.Components;

model AmplitudeMeter
    
    parameter Real inputFrequencyHz;
    
    parameter Real samplesPerPeriod;
    
    parameter Real adcReferenceVoltage = 1;
    
    parameter Integer sampleResolutionInBits = 10;

  Modelica.Blocks.Interfaces.RealInput voltage annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput amplitude annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EmFieldSensor.Components.AnalogToInteger analogToInteger(referenceVoltage = adcReferenceVoltage, resolutionInBits = sampleResolutionInBits)  annotation(
    Placement(visible = true, transformation(origin = {-58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.IntegerToReal integerToReal1 annotation(
    Placement(visible = true, transformation(origin = {-32, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Electrical.Digital.Sources.Pulse pulse1(nperiod = -1, period = 1.0 / (inputFrequencyHz*samplesPerPeriod), pulse = Modelica.Electrical.Digital.Interfaces.Logic.'1', quiet = Modelica.Electrical.Digital.Interfaces.Logic.'0', startTime = 0, width = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sampledField annotation(
    Placement(visible = true, transformation(origin = {106, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Mean mean1(f = inputFrequencyHz)  annotation(
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ScaleToReference scaleToReference1(referenceVoltage = adcReferenceVoltage, resolutionInBits = sampleResolutionInBits)  annotation(
    Placement(visible = true, transformation(origin = {68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(scaleToReference1.scaled, amplitude) annotation(
    Line(points = {{80, 0}, {98, 0}, {98, 0}, {106, 0}}, color = {0, 0, 127}));
  connect(mean1.y, scaleToReference1.adcValue) annotation(
    Line(points = {{44, 0}, {54, 0}, {54, 0}, {56, 0}}, color = {0, 0, 127}));
  connect(integerToReal1.y, mean1.u) annotation(
    Line(points = {{-26, 0}, {18, 0}, {18, 0}, {20, 0}}, color = {0, 0, 127}));
  connect(pulse1.y, analogToInteger.trigger) annotation(
    Line(points = {{-80, 36}, {-76, 36}, {-76, 6}, {-68, 6}, {-68, 6}, {-68, 6}}, color = {127, 0, 127}));
  connect(integerToReal1.y, sampledField) annotation(
    Line(points = {{-25, 0}, {0, 0}, {0, 28}, {106, 28}}, color = {0, 0, 127}));
  connect(analogToInteger.integerOutput, integerToReal1.u) annotation(
    Line(points = {{-47.4, 0}, {-41.4, 0}, {-41.4, 0}, {-39.4, 0}}, color = {255, 127, 0}));
  connect(voltage, analogToInteger.voltageToGround) annotation(
    Line(points = {{-120, 0}, {-68, 0}}, color = {0, 0, 127}));
end AmplitudeMeter;