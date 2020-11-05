BOARD = esp8266:esp8266:nodemcuv2
BAUD = 115200
FQBN = $(BOARD):led=2,baud=$(BAUD)
PORT = /dev/cu.SLAB_USBtoUART
TTY = /dev/cu.SLAB_USBtoUART
CC = arduino-cli

compile: 
	$(CC) compile --verbose --fqbn $(FQBN)

flash: 
	$(CC) upload -p $(PORT) --fqbn $(FQBN) `pwd`

serial:
	@echo "Type ~. to exit"
	cu -l $(TTY) -s $(BAUD)

setup:
	$(CC) config init --additional-urls https://arduino.esp8266.com/stable/package_esp8266com_index.json,https://dl.espressif.com/dl/package_esp32_index.json
	$(CC) core update-index
	$(CC) core install esp8266:esp8266
	$(CC) lib install WiFiManager "Adafruit NeoPixel"

clean:
	rm -rf build
