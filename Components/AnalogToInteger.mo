within EmFieldSensor.Components;

model AnalogToInteger

    parameter Real minVoltage;
    parameter Real maxVoltage;
    parameter Integer resolutionInBits = 10;
        
  Modelica.Blocks.Interfaces.RealInput voltageToGround annotation(
    Placement(visible = true, transformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Electrical.Digital.Interfaces.DigitalInput trigger annotation(
    Placement(visible = true, transformation(origin = {-100, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
  Modelica.Blocks.Interfaces.IntegerOutput integerOutput annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
  Modelica.Electrical.Analog.Ideal.AD_Converter aD_Converter1(N = resolutionInBits, Rin = 1000, VRefHigh = maxVoltage, VRefLow = minVoltage)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DigitalToInteger digitalToInteger1(amountOfBits = resolutionInBits)  annotation(
    Placement(visible = true, transformation(origin = {28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(
    Placement(visible = true, transformation(origin = {-56, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-56, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(signalVoltage1.n, ground1.p) annotation(
    Line(points = {{-56, -10}, {-56, -30}}, color = {0, 0, 255}));
  connect(signalVoltage1.n, aD_Converter1.n) annotation(
    Line(points = {{-56, -10}, {-38, -10}, {-38, -6}, {-36, -6}}, color = {0, 0, 255}));
  connect(signalVoltage1.p, aD_Converter1.p) annotation(
    Line(points = {{-56, 10}, {-38, 10}, {-38, 8}, {-36, 8}}, color = {0, 0, 255}));
  connect(voltageToGround, signalVoltage1.v) annotation(
    Line(points = {{-104, 0}, {-64, 0}, {-64, 0}, {-64, 0}}, color = {0, 0, 127}));
  connect(trigger, aD_Converter1.trig) annotation(
    Line(points = {{-100, 58}, {-30, 58}, {-30, 10}, {-30, 10}}, color = {127, 0, 127}));
  connect(digitalToInteger1.integerOutput, integerOutput) annotation(
    Line(points = {{38, 0}, {98, 0}, {98, 0}, {106, 0}}, color = {255, 127, 0}));
  connect(aD_Converter1.y, digitalToInteger1.digitalInput) annotation(
    Line(points = {{-22, 0}, {18, 0}, {18, 0}, {18, 0}}, color = {127, 0, 127}, thickness = 0.5));
end AnalogToInteger;