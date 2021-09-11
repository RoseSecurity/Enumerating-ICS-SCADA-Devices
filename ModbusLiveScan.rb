#!/usr/bin/env ruby

require 'rmodbus'

# Stuff to print text in colour
class String
	def red;            "\033[31m#{self}\033[0m" end
	def green;          "\033[32m#{self}\033[0m" end
	def brown;          "\033[33m#{self}\033[0m" end
	def blue;           "\033[34m#{self}\033[0m" end
	def bg_gray;        "\033[47m#{self}\033[0m" end
end

@results = Array.new()
@target  = ARGV[0]
delay = ARGV[1]

# Send Modbus requests
def modbus_request(ip, port, start_address, stop_address)
  cl = ModBus::TCPClient.new(ip, port)
  slave = cl.with_slave(1)
	unless start_address == 0
		start_address = start_address + 1
	end
  test  = slave.holding_registers[start_address..stop_address]
  return test
end

# grab all registers values until 65 500 ("à peu près")
def grab_all_registers
	registers = Array.new()
	for i in 0..654
		result = modbus_request(@target, 502, (i*100), ((i+1)*100))
		j = 0
		result.each do |yolo|
			registers.push(yolo)
			j = j + 1
		end
	end
	result = modbus_request(@target, 502, 65500, 65535)
	j = 0
	result.each do |yolo|
		registers.push(yolo)
		j = j + 1
	end

	return registers
end

trap("INT") {
	puts ""; puts "[+] Live monitoring stopped".green; exit
}

round = 0
while(1)
	puts '[+]'.green + ' Reading registers (#' + round.to_s + ')'
	@results.push(grab_all_registers)
	unless round == 0
		for b in 0..@results[0].length
			if !(@results[0][b] == @results[1][b])
				puts "[!] Register ##{b} changed from #{@results[0][b]} to #{@results[1][b]} !!! ".red.bg_gray
			end
		end
		@results.delete_at(0)
	end
	round = round + 1
	puts "[+] Waiting #{delay}s ..."
	sleep(delay.to_i)
end
