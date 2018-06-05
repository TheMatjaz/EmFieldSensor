within EmFieldSensor.Components;

model Antenna

    parameter Real resonantFrequencyHz;

  Modelica.Blocks.Interfaces.RealInput field annotation(
    Placement(visible = true, transformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput voltage annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Filter bandPassFilter(analogFilter = Modelica.Blocks.Types.AnalogFilter.CriticalDamping, f_cut = resonantFrequencyHz, f_min = 500, filterType = Modelica.Blocks.Types.FilterType.BandPass, order = 4) 
  
   annotation(
    Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
equation
  connect(bandPassFilter.y, voltage) annotation(
    Line(points = {{10, 0}, {100, 0}, {100, 0}, {106, 0}}, color = {0, 0, 127}));
  connect(field, bandPassFilter.u) annotation(
    Line(points = {{-108, 0}, {-16, 0}, {-16, 0}, {-14, 0}}, color = {0, 0, 127}));



       
end Antenna;