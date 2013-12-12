ROOTDIR  =../../..
PKGNAME  =touchvg
PROJNAME =cmdbase

SHAPEI_DIR  =$(ROOTDIR)/../TouchVGShape/core/include
INCLUDES += -I$(SHAPEI_DIR) \
            -I$(SHAPEI_DIR)/geom \
            -I$(SHAPEI_DIR)/graph \
            -I$(SHAPEI_DIR)/canvas \
            -I$(SHAPEI_DIR)/shape \
            -I$(SHAPEI_DIR)/storage \
            -I$(ROOTDIR)/core/include/cmd \
            -I$(ROOTDIR)/core/include/cmdbase \
            -I$(ROOTDIR)/core/include/cmdobserver

SOURCES   =$(wildcard *.cpp) \
           $(wildcard ../geom/*.cpp) \
           $(wildcard ../graph/*.cpp) \
           $(wildcard ../shape/*.cpp)

include $(ROOTDIR)/core/mk/config.mk
include $(ROOTDIR)/core/mk/Makefile.swig
