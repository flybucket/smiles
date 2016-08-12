import CHIP_IO.PWM as PWM
#PWM.start(channel, duty, freq=2000, polarity=0)
#duty values are valid 0 (off) to 100 (on)
PWM.start("PWM0", 50)
PWM.set_duty_cycle("PWM0", 0)
PWM.set_frequency("PWM0", 50
time.sleep(1)
PWM.set_duty_cycle("PWM0",50)
time.sleep(1) 
PWM.set_duty_cycle("PWM0",100)
time.sleep(1))

PWM.stop("PWM0")
PWM.cleanup()

#set polarity to 1 on start:
PWM.start("PWM0", 50, 2000, 1)
