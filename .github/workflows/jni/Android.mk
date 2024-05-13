LOCAL_PATH := $(call my-dir)/..

include $(CLEAR_VARS)

LOCAL_MODULE    := jnidispatch
LOCAL_SRC_FILES := \
        native/dispatch.c \
        native/callback.c
LOCAL_CFLAGS += -DANDROID -pipe -integrated-as -fno-plt -Ofast -flto -mllvm -polly -mllvm -polly-vectorizer=stripmine -mllvm -polly-invariant-load-hoisting -mllvm -polly-run-inliner -mllvm -polly-run-dce -Wno-error=implicit-function-declaration
LOCAL_CFLAGS += -I"/opt/hostedtoolcache/Java_Zulu_jdk/21.0.3-9/x64/include" -I"/opt/hostedtoolcache/Java_Zulu_jdk/21.0.3-9/x64/include/linux" -I"./build/headers"' 
LOCAL_LDLIBS := -llog
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include

include $(BUILD_SHARED_LIBRARY)
