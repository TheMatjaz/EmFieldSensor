within EmFieldSensor.Components;

model Spectrum
  Modelica.Blocks.Sources.Sine sine1(freqHz = 100000, phase = 0.174533)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine2(freqHz = 125000)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine3(freqHz = 150000)  annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine4(freqHz = 200000, phase = 0.226893)  annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum1(nin = 4)  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput signals annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sum1.y, signals) annotation(
    Line(points = {{42, 0}, {92, 0}, {92, 0}, {98, 0}}, color = {0, 0, 127}));
  connect(sine4.y, sum1.u[4]) annotation(
    Line(points = {{-38, -70}, {18, -70}, {18, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(sine3.y, sum1.u[3]) annotation(
    Line(points = {{-38, -30}, {18, -30}, {18, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(sine2.y, sum1.u[2]) annotation(
    Line(points = {{-38, 10}, {16, 10}, {16, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(sine1.y, sum1.u[1]) annotation(
    Line(points = {{-38, 50}, {18, 50}, {18, 0}, {18, 0}}, color = {0, 0, 127}));

end Spectrum;