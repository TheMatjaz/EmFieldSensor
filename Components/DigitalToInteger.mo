within EmFieldSensor.Components;

model DigitalToInteger
    // Works in Little Endian mode!
    
    import Logic = Modelica.Electrical.Digital.Interfaces.Logic;
    
    parameter Integer amountOfBits = 8;
      
  Modelica.Electrical.Digital.Interfaces.DigitalInput digitalInput[amountOfBits] annotation(
    Placement(visible = true, transformation(origin = {-98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
  Modelica.Blocks.Interfaces.IntegerOutput integerOutput annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
function logicBitsToInteger
    input Logic[:] bits;
    output Integer casted;
    
algorithm
    casted := 0;
    for bitIndex in 1:size(bits, 1) loop
        if bits[bitIndex] == Logic.'1' or bits[bitIndex] == Logic.'H'
        then
            casted := casted + integer(2^(bitIndex - 1));
        end if;
    end for;
end logicBitsToInteger;

equation
   integerOutput = logicBitsToInteger(digitalInput);

end DigitalToInteger;