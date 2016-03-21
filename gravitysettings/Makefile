include theos/makefiles/common.mk

BUNDLE_NAME = Gravity
Gravity_FILES = GravityController.mm
Gravity_INSTALL_PATH = /Library/PreferenceBundles
Gravity_FRAMEWORKS = UIKit QuartzCore CoreGraphics MessageUI Social Twitter
Gravity_PRIVATE_FRAMEWORKS = Preferences
Gravity_CFLAGS = -fobjc-arc
Gravity_LDFLAGS = -Wl,-segalign,4000
Gravity_ARCHS = armv7 arm64
export ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/bundle.mk

all::
	@echo "[+] Copying Files..."
	@ldid -S ./obj/Gravity.bundle/Gravity
	@cp ./obj/Gravity.bundle/Gravity //Library/PreferenceBundles/Gravity.bundle/Gravity
	@echo "DONE"
	
