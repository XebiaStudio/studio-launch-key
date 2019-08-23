# !/bin/bash

# export pin $1 if it has not been exported yet
exportPin() {
	if [ ! -e /sys/class/gpio/gpio$1 ]; then
		echo "$1" > /sys/class/gpio/export
	fi
}

# set the direction of pin $1 to be an input
setInput() {
	echo "in" > /sys/class/gpio/gpio$1/direction
}

# set the direction of pin $1 to be an output
setOutput() {
	echo "out" > /sys/class/gpio/gpio$1/direction
}

# set pin $1 to value $2
setValue() {
	echo $2 > /sys/class/gpio/gpio$1/value
}

# get value from pin $1
valueOf() {
    echo /sys/class/gpio/gpio$1/value
}

# set the pin numbers we'll be using
KEY_1=12
KEY_2=13
BTN_PRESS=21
BTN_LED=22

ON="1"
OFF="0"

exportPin $KEY_1
exportPin $KEY_2
exportPin $BTN_PRESS
exportPin $BTN_LED

setOutput $KEY_1
setOutput $KEY_2
setOutput $BTN_PRESS
setOutput $BTN_LED

while true; do
    if [ "$(valueOf $KEY_1)" == $ON && "$(valueOf $KEY_2)" == $ON]; then
        setValue $BTN_LED $ON
    fi
    sleep 1
done