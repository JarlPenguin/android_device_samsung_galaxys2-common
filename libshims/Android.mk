#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := pthread_join.cpp
LOCAL_SYSTEM_SHARED_LIBRARIES := libc
LOCAL_SHARED_LIBRARIES := libdl
LOCAL_MODULE := libC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	proto/pb_common.cpp \
	proto/pb_decode.cpp \
	proto/pb_encode.cpp \
	proto/sap-api.pb.cpp \
	sap-functions.cpp \
	secril-sap.cpp \
	sec-sap.cpp \
	secril-shim.cpp
LOCAL_SHARED_LIBRARIES := \
	liblog \
	libril \
	libcutils \
	libbinder \
	libc
LOCAL_C_INCLUDES += proto
LOCAL_CFLAGS := -Wall -Werror -DPB_ENABLE_MALLOC -Wno-unused-parameter -DPB_FIELD_16BIT
LOCAL_MODULE := libsecril-shim
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := CameraSource.cpp ACodec.cpp
LOCAL_C_INCLUDES := \
    $(TOP)/frameworks/av/include \
    $(TOP)/frameworks/av/media/libstagefright/omx/include \
    $(TOP)/frameworks/native/include/media/hardware \
    $(TOP)/frameworks/native/include/media/openmax \
    $(TOP)/frameworks/native/libs/arect/include \
    $(TOP)/frameworks/native/libs/nativebase/include \
    $(TOP)/frameworks/native/libs/nativewindow/include \
    $(TOP)/hardware/samsung/exynos4/hal/include \
    $(TOP)/device/samsung/galaxys2-common/include
LOCAL_SHARED_LIBRARIES := \
    android.hardware.graphics.bufferqueue@1.0 \
    android.hardware.media.omx@1.0 \
    android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.token@1.0-utils \
    libstagefright \
    libstagefright_foundation \
    libbase \
    libcamera_client \
    liblog \
    libnativewindow \
    libui \
    libutils
LOCAL_MODULE := libstagefright-shim
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)
