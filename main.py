'''
This code sets up waiting for the button press to execute run.run() 
It will also the onboard LED on while it executes that function.
Your custom code should live in the run.py file and the 
function you want executed when the button is pressed should be called `run`.
'''

from machine import Pin

led = Pin(2, Pin.OUT)
led(0)

boot_btn = Pin(0, Pin.IN)


def callback(p):
    # turn on the led to show that I am starting a job
    led(1)
    # looks like i didnt start a custom job from the webrepl,
    # start the job automatically from here because i pressed the boot button
    import run
    run.run()
    led(0)


boot_btn.irq(lambda p: callback(p))
