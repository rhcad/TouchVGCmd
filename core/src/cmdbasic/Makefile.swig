ROOTDIR  =../../..
PKGNAME  =touchvg
PROJNAME =cmdbasic

SHAPEI_DIR  =$(ROOTDIR)/../TouchVGShape/core/include
INCLUDES += -I$(SHAPEI_DIR) \
            -I$(SHAPEI_DIR)/geom \
            -I$(SHAPEI_DIR)/graph \
            -I$(SHAPEI_DIR)/shape \
            -I$(SHAPEI_DIR)/canvas \
            -I$(SHAPEI_DIR)/storage \
            -I$(ROOTDIR)/core/include/cmd \
            -I$(ROOTDIR)/core/include/cmdbase \
            -I$(ROOTDIR)/core/include/cmdobserver \
            -I$(ROOTDIR)/core/include/cmdbasic

SOURCES   =$(wildcard *.cpp) \
           $(wildcard ../../pub_src/geom/*.cpp) \
           $(wildcard ../../pub_src/graph/*.cpp) \
           $(wildcard ../../pub_src/shape/*.cpp) \
           $(wildcard ../../pub_src/cmdbase/*.cpp)

include $(ROOTDIR)/core/mk/config.mk
include $(ROOTDIR)/core/mk/Makefile.swig
