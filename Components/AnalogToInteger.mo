within EmFieldSensor.Components;

model AnalogToInteger
Modelica.Electrical.Analog.Ideal.AD_Converter AnalogToDigitalLogicVector(N = 10, Rin = 1, VRefHigh = 1.5, VRefLow = -1.5) annotation(
    Placement(visible = true, transformation(origin = {-24, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput voltageToGround annotation(
    Placement(visible = true, transformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground Ground annotation(
    Placement(visible = true, transformation(origin = {-8, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.DA_Converter DA(N = 10, Vref = 1.5)  annotation(
    Placement(visible = true, transformation(origin = {10, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.RealToInteger realToInteger annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.IntegerOutput value annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Digital.Interfaces.DigitalInput trigger annotation(
    Placement(visible = true, transformation(origin = {-100, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(trigger, DA.trig) annotation(
    Line(points = {{-100, 58}, {10, 58}, {10, 1}}, color = {127, 0, 127}));
  connect(DA.p, realToInteger.u) annotation(
    Line(points = {{17, -1}, {26, -1}, {26, 0}, {28, 0}}, color = {0, 0, 255}));
  connect(Ground.p, DA.n) annotation(
    Line(points = {{-8, -26}, {17, -26}, {17, -15}}, color = {0, 0, 255}));
  connect(AnalogToDigitalLogicVector.y, DA.x) annotation(
    Line(points = {{-17, -8}, {3, -8}}, color = {127, 0, 127}, thickness = 0.5));
  connect(trigger, AnalogToDigitalLogicVector.trig) annotation(
    Line(points = {{-100, 58}, {-24, 58}, {-24, 1}}, color = {127, 0, 127}));
  connect(Ground.p, AnalogToDigitalLogicVector.n) annotation(
    Line(points = {{-8, -26}, {-31, -26}, {-31, -15}}, color = {0, 0, 255}));
  connect(voltageToGround, AnalogToDigitalLogicVector.p) annotation(
    Line(points = {{-104, 0}, {-31, 0}, {-31, -1}}, color = {0, 0, 127}));
  connect(realToInteger.y, value) annotation(
    Line(points = {{52, 0}, {106, 0}}, color = {255, 127, 0}));
end AnalogToInteger;