TARGET = res/isdown
DEST = /usr/bin/isdown
install: SHELL:=/bin/bash
install: $(TARGET)
	./res/prepare.sh && printf "\n\nINSTALLING" && cp res/isdown /usr/bin/isdown && printf "\n\nINSTALLED!" && exit 0 || exit 1
	
all: SHELL:=/bin/bash
all: $(TARGET)
	./res/prepare.sh && printf "\n\nINSTALLING" && cp res/isdown /usr/bin/isdown && printf "\n\nINSTALLED!" && exit 0 || exit 1

clean:
	rm -f $(DEST)
