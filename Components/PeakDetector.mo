within EmFieldSensor.Components;

model PeakDetector
  parameter Real initialMaximum = 0;
  parameter Real outputRefreshFrequency;
  
  Modelica.Blocks.Interfaces.RealInput inputValue annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput outputValue annotation(
    Placement(visible = true, transformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MinMax minMax1 annotation(
    Placement(visible = true, transformation(origin = {2, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
protected
  parameter Modelica.SIunits.Time t0(fixed=false) "Start time of simulation";
  Real peak "Found maximum so far";
  
initial equation
  t0 = time;
  peak = initialMaximum;
equation
  peak = max(peak, inputValue);
  when sample(t0 + 1/outputRefreshFrequency, 1/outputRefreshFrequency) then
    outputValue = peak;
    reinit(peak, 0);
  end when;

end PeakDetector;