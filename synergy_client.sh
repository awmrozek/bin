#!/bin/bash
 /bin/pidof synergyc &>/dev/null || ( ( /usr/bin/synergyc -f --debug ERROR --name m3mory --restart ws2016:24800 ) & )
