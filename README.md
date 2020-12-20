
1. flash the esp32 with micropython
2. put webrepl on the esp32
3. configure webrepl with a password
4. rename ConnectWiFi.py.example to ConnectWiFi.py and update the wifi credentials inside
5. copy the ConnectWiFi.py script to the esp32
6. copy the boot.py script to the esp32
7. connect to the the repl
8. if you have recently copied files over, either hit the reset button, or do it via code

    `import machine; machine.reset()`
9. reconnect to the repl
