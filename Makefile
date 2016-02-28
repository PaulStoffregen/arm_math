
# Step 1: edit this to the pathname for your arm-none-eabi toolchain

ARMPATH := ~/teensy/arduino-1.6.7/hardware/tools/arm/bin

# Step 2: select the library architecture to build

LIBNAME     := arm_cortexM4l_math.a
ARCH_FLAGS  := -mcpu=cortex-m4 -mthumb
#LIBNAME     := arm_cortexM4lf_math.a
#ARCH_FLAGS  := -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16
#LIBNAME     := arm_cortexM3l_math.a
#ARCH_FLAGS  := -mcpu=cortex-m3 -mthumb
#LIBNAME     := arm_cortexM0l_math.a
#ARCH_FLAGS  := -mcpu=cortex-m0plus -mthumb

# Step 3: set optional/extra build parameters

OPT_FLAGS   := -O2 -g
BUILD_FLAGS := -ffunction-sections -fdata-sections -fsingle-precision-constant


# Normally this stuff should not need to be edited

CC = $(ARMPATH)/arm-none-eabi-gcc
AR = $(ARMPATH)/arm-none-eabi-ar
C_FILES := $(wildcard src/*.c)
O_FILES := $(C_FILES:.c=.o)
CFLAGS := -Wall $(OPT_FLAGS) $(ARCH_FLAGS) $(BUILD_FLAGS)

$(LIBNAME): $(O_FILES)
	$(AR) rcs $@ $(O_FILES)

clean:
	rm -f *.a src/*.o

