# This file is executed on every boot (including wake-boot from deepsleep)
#import esp
#esp.osdebug(None)
import ConnectWiFi
ConnectWiFi.connect()

import webrepl
webrepl.start()
