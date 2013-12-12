ROOTDIR     =../../..
TARGET      =libcmdmgr.a
SRCS        =$(wildcard *.cpp)
OBJS        =$(SRCS:.cpp=.o)
INSTALL_DIR ?=$(ROOTDIR)/build
SHAPEI_DIR  =$(ROOTDIR)/../TouchVGShape/core/include

CPPFLAGS    += -Wall \
               -I$(SHAPEI_DIR) \
               -I$(SHAPEI_DIR)/geom \
               -I$(SHAPEI_DIR)/graph \
               -I$(SHAPEI_DIR)/shape \
               -I$(ROOTDIR)/core/include/cmd \
               -I$(ROOTDIR)/core/include/cmdobserver \
               -I$(ROOTDIR)/core/include/cmdmgr

all:        $(TARGET)
$(TARGET):  $(OBJS)
	$(AR) $(ARFLAGS) $@ $(OBJS)

clean:
	@rm -rfv *.o *.a
ifdef touch
	@touch -c *
endif

install:
	@test -d $(INSTALL_DIR) || mkdir $(INSTALL_DIR)
	@! test -e $(TARGET) || cp -v $(TARGET) $(INSTALL_DIR)
