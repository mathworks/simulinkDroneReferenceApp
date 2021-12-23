function massRollUp(instance,varargin)
    % mySum2 Example Analysis Function

if instance.isComponent()
 
    if ~isempty(instance.Components)
        mass = 0;
        for child=instance.Components
            mass = mass + child.getValue('OnboardElement.Mass');
        end
        instance.setValue('OnboardElement.Mass',mass);
   
    end
  
end

end
