within EmFieldSensor.Components;

model AnalogToInteger

    parameter Real minVoltage;
    parameter Real maxVoltage;
    parameter Integer resolutionInBits;
Modelica.Electrical.Analog.Ideal.AD_Converter AnalogToDigitalLogicVector(N = resolutionInBits, Rin = 1, VRefHigh = maxVoltage, VRefLow = minVoltage) annotation(
    Placement(visible = true, transformation(origin = {-24, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput voltageToGround annotation(
    Placement(visible = true, transformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-30, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Digital.Interfaces.DigitalInput trigger annotation(
    Placement(visible = true, transformation(origin = {-100, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput value annotation(
    Placement(visible = true, transformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground.p, AnalogToDigitalLogicVector.n) annotation(
    Line(points = {{-30, -34}, {-31, -34}, {-31, -15}}, color = {0, 0, 255}));
  connect(trigger, AnalogToDigitalLogicVector.trig) annotation(
    Line(points = {{-100, 58}, {-24, 58}, {-24, 1}}, color = {127, 0, 127}));
  connect(voltageToGround, AnalogToDigitalLogicVector.p) annotation(
    Line(points = {{-104, 0}, {-31, 0}, {-31, -1}}, color = {0, 0, 127}));
end AnalogToInteger;