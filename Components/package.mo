within EmFieldSensor;

package Components








  model Denormalizer
    Modelica.Blocks.Interfaces.RealInput normalized annotation(
      Placement(visible = true, transformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput denormalized annotation(
      Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput gainUsedForNormalization annotation(
      Placement(visible = true, transformation(origin = {-104, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-104, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    denormalized = normalized/gainUsedForNormalization;
  end Denormalizer;



end Components;