TARGET = res/isdown
DEST = /usr/bin/isdown

install: $(TARGET)
	#cp $(TARGET) $(DEST)
	./res/checkdistro.sh

all: $(TARGET)
	./res/checkdistro.sh
	#cp $(TARGET) $(DEST)

clean:
	rm -f $(DEST)
