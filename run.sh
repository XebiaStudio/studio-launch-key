# !/bin/bash

# export a pin if it has not been exported yet
exportPin() {
	if [ ! -e /sys/class/gpio/gpio$1 ]; then
		echo "$1" > /sys/class/gpio/export
	fi
}

setInput() {
	echo "in" > /sys/class/gpio/gpio$1/direction
}

setOutput() {
	echo "out" > /sys/class/gpio/gpio$1/direction
}

setValue() {
	echo "$2" > /sys/class/gpio/gpio$1/value
}

exportPin 12
exportPin 18
exportPin 22
