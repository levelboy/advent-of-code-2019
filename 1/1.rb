def fuel_for_weight(weight)
    return 0 if weight <= 0

    fuel_needed = (weight/3).floor - 2
    fuel_needed = 0 if fuel_needed < 0
    return fuel_needed + fuel_for_weight(fuel_needed)
end

module_weights = IO.readlines('input.log', chomp: true).map(&:to_i)

p module_weights.inject(0) { |total_fuel, module_weight| total_fuel + fuel_for_weight(module_weight) }
