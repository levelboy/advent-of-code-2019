EXIT = 99
START_ADDRESS = 0

OPCODE = { add: 1, multiply: 2, halt: 99 }
ADD_INSTRUCTION_SIZE = 4
MULTIPLY_INSTRUCTION_SIZE = 4

class Program
    def initialize(file_name)
        @file_name = file_name
    end

    def execute(noun, verb)
        instruction_pointer = START_ADDRESS
        memory =  IO.readlines(@file_name, chomp: true)[0].split(',').map(&:to_i)
        memory[1] = noun
        memory[2] = verb
        while instruction_pointer <= memory.length do
            instruction = memory[instruction_pointer]
            case instruction
            when OPCODE[:add]
            
                parameter1 = memory[memory[instruction_pointer+1]]
                parameter2 = memory[memory[instruction_pointer+2]]
                destination = memory[instruction_pointer+3]
                memory[destination] = parameter1 + parameter2
                instruction_pointer = instruction_pointer + ADD_INSTRUCTION_SIZE
            when OPCODE[:multiply]
                parameter1 = memory[memory[instruction_pointer+1]]
                parameter2 = memory[memory[instruction_pointer+2]]
                destination = memory[instruction_pointer+3]
                memory[destination] = parameter1 * parameter2
                instruction_pointer = instruction_pointer + MULTIPLY_INSTRUCTION_SIZE
            else
                return memory[0]
            end
        end
        
        memory[0]
    end
end

program = Program.new('input.log')
(0..99).each do |noun|
    (0..99).each do |verb|
        result = program.execute(noun, verb)
        p "#{noun} #{verb}" if result == 19690720
    end
end