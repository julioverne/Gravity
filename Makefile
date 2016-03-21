include theos/makefiles/common.mk

TWEAK_NAME = Gravity
Gravity_FILES = Gravity.xm
Gravity_FRAMEWORKS = UIKit CoreGraphics CoreImage CoreMotion Foundation CoreFoundation QuartzCore CydiaSubstrate
#Gravity_PRIVATE_FRAMEWORKS = PhysicsKit
Gravity_CFLAGS = -fobjc-arc -std=c++11
Gravity_LDFLAGS = -Wl,-segalign,4000
export ARCHS = armv7 arm64
Gravity_ARCHS = armv7 arm64
include $(THEOS_MAKE_PATH)/tweak.mk

all::
	@echo "[+] Copying Files..."
	@ldid -S ./obj/Gravity.dylib
	@cp ./obj/Gravity.dylib //Library/MobileSubstrate/DynamicLibraries/Gravity.dylib
	@cp ./Gravity.plist //Library/MobileSubstrate/DynamicLibraries/Gravity.plist
	@echo "DONE"
	@killall SpringBoard

	
