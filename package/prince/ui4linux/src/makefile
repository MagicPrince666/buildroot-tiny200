TARGET	= ui4linux

DIR		= . 
INC		= -I. 
CFLAGS	= -Os -Wall -finput-charset=UTF-8 -fexec-charset=GBK
LDFLAGS = -lpng -lz

OBJPATH	= .

FILES	= $(foreach dir,$(DIR),$(wildcard $(dir)/*.c))

OBJS	= $(patsubst %.c,%.o,$(FILES))

all:$(OBJS) $(TARGET)

$(OBJS):%.o:%.c
	$(CC) $(CFLAGS) $(INC) -c -o $(OBJPATH)/$(notdir $@) $< 

$(TARGET):$(OBJPATH)
	$(CC)  $(OBJPATH)/*.o -o $@ $(LDFLAGS)

install:
	cp $(TARGET) $(DESTDIR)/usr/bin/

clean:
	-rm *.o
	-rm $(TARGET)