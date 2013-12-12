# Copyright (c) 2013, Zhang Yungui, https://github.com/rhcad/touchvg

LOCAL_PATH := $(call my-dir)
cflags     := -frtti -Wall -Wextra -Wno-unused-parameter

core_inc   := $(call my-dir)/../../../core/include
base_inc   := $(call my-dir)/../../../../TouchVGShape/core/include
base_incs  := $(base_inc) \
              $(base_inc)/canvas \
              $(base_inc)/geom \
              $(base_inc)/graph \
              $(base_inc)/jsonstorage \
              $(base_inc)/shape \
              $(base_inc)/storage \
              $(base_inc)/shapedoc \
              $(base_inc)/test

c_includes := $(core_inc)/cmd \
              $(core_inc)/cmdbase \
              $(core_inc)/cmdobserver \
              $(core_inc)/cmdbasic \
              $(core_inc)/cmdmgr
core_src   := ../../../core/src

base_files := $(core_src)/cmdbase/mgcmddraw.cpp \
              $(core_src)/cmdbase/mgdrawarc.cpp \
              $(core_src)/cmdbase/mgdrawrect.cpp \
              $(core_src)/cmdbase/mgsplock.cpp

basic_files := $(core_src)/cmdbasic/cmdbasic.cpp \
              $(core_src)/cmdbasic/mgbasicspreg.cpp \
              $(core_src)/cmdbasic/mgcmderase.cpp \
              $(core_src)/cmdbasic/mgdrawcircle.cpp \
              $(core_src)/cmdbasic/mgdrawdiamond.cpp \
              $(core_src)/cmdbasic/mgdrawellipse.cpp \
              $(core_src)/cmdbasic/mgdrawfreelines.cpp \
              $(core_src)/cmdbasic/mgdrawgrid.cpp \
              $(core_src)/cmdbasic/mgdrawline.cpp \
              $(core_src)/cmdbasic/mgdrawlines.cpp \
              $(core_src)/cmdbasic/mgdrawparallel.cpp \
              $(core_src)/cmdbasic/mgdrawpolygon.cpp \
              $(core_src)/cmdbasic/mgdrawsplines.cpp \
              $(core_src)/cmdbasic/mgdrawsquare.cpp \
              $(core_src)/cmdbasic/mgdrawtriang.cpp

mgr_files  := $(core_src)/cmdmgr/cmdsubject.cpp \
              $(core_src)/cmdmgr/mgactions.cpp \
              $(core_src)/cmdmgr/mgcmdmgr_.cpp \
              $(core_src)/cmdmgr/mgcmdmgr2.cpp \
              $(core_src)/cmdmgr/mgcmdselect.cpp \
              $(core_src)/cmdmgr/mgsnapimpl.cpp

include $(CLEAR_VARS)
LOCAL_MODULE     := libTouchVGCmd
LOCAL_CFLAGS     := $(cflags)
LOCAL_C_INCLUDES := $(base_incs) $(c_includes)
LOCAL_SRC_FILES  := $(base_files) $(basic_files) $(mgr_files)
include $(BUILD_STATIC_LIBRARY)
