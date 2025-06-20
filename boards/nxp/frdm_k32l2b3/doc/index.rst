.. zephyr:board:: frdm_k32l2b3

Overview
********

The FRDM-K32L2B3 FRDM development board provides a platform for evaluation
and development of the K32 L2B MCU Family. The board includes onboard debug
probe, segment LCD, accelerometer/magnetometer, a full speed USB and easy access
to K32 L2B's MCU I/O. The FRDM-K32L2B3 board is fully supported by the MCUXpresso
suite of tools, which provides device drivers, middleware and examples to allow
rapid development, plus configuration tools and an optional free IDE.

Hardware
********

- K32L2B31VLH0A MCU running at up to 48 MHz
- 256 kB Flash Memory
- 32 kB SRAM Memory
- Full-speed USB port with micro A/B connector for device functionality
- Easy Access to K32 L2B MCU I/O
- NXP FXOS8700CQ digital sensor, 3D accelerometer (±2g/±4g/±8g) + 3D magnetometer
- 2x low-power UART, 1x UART, 2x I2C, 2x SPI
- Form factor compatible with Arduino® Rev3 pin layout
- On-board segment LCD
- OpenSDA debug interface
- Form factor compatible with Arduino® Rev3 pin layout

For more information about the MCXC444 SoC and FRDM-MCXC444 board, see
these references:

- `MCX C14x/24x/44x Website`_
- `MCX C44x Datasheet`_
- `MCX C44x Reference Manual`_
- `FRDM-MCXC444 Website`_
- `FRDM-MCXC444 User Manual`_
- `FRDM-MCXC444 Design Files`_

Supported Features
==================

.. zephyr:board-supported-hw::

Connections and IOs
===================

The K32L2B3 SoC has five pairs of pinmux/gpio controllers (PORTA/GPIOA,
PORTB/GPIOB, PORTC/GPIOC, PORTD/GPIOD, and PORTE/GPIOE) for the FRDM-K32L2B3 board.

+-------+-------------+---------------------------+
| Name  | Function    | Usage                     |
+=======+=============+===========================+
| PTE20 | ADC         | ADC0 channel 1            |
+-------+-------------+---------------------------+
| PTE31 | GPIO        | Red LED                   |
+-------+-------------+---------------------------+
| PTD5  | GPIO        | Green LED                 |
+-------+-------------+---------------------------+
| PTE29 | GPIO        | Blue LED                  |
+-------+-------------+---------------------------+
| PTA1  | LPUART0_RX  | UART Console              |
+-------+-------------+---------------------------+
| PTA2  | LPUART0_TX  | UART Console              |
+-------+-------------+---------------------------+
| PTA20 | RESET       | RESET Button SW1          |
+-------+-------------+---------------------------+
| PTC3  | GPIO        | User button SW2           |
+-------+-------------+---------------------------+
| PTA4  | GPIO        | User button SW3           |
+-------+-------------+---------------------------+
| PTE25 | I2C0_SDA    | I2C accelerometer         |
+-------+-------------+---------------------------+
| PTE24 | I2C0_SCL    | I2C accelerometer         |
+-------+-------------+---------------------------+

System Clock
============

The K32L2B3 SoC is configured to use HIRC running at 48 MHz as a system clock source.

Serial Port
===========

The K32L2B3 LPUART0 is used for the console.

Programming and Debugging
*************************

.. zephyr:board-supported-runners::

Build and flash applications as usual (see :ref:`build_an_application` and
:ref:`application_run` for more details).

Configuring a Debug Probe
=========================

A debug probe is used for both flashing and debugging the board. This board is
configured by default to use the MCU-Link CMSIS-DAP Onboard Debug Probe.

Using LinkServer
----------------

Linkserver is the default runner for this board, and supports the factory
default MCU-Link firmware. Follow the instructions in
:ref:`mcu-link-cmsis-onboard-debug-probe` to reprogram the default MCU-Link
firmware. This only needs to be done if the default onboard debug circuit
firmware was changed. To put the board in ``DFU mode`` to program the firmware,
short jumper JP2.

Using J-Link
------------

There are two options. The onboard debug circuit can be updated with Segger
J-Link firmware by following the instructions in
:ref:`mcu-link-jlink-onboard-debug-probe`.
To be able to program the firmware, you need to put the board in ``DFU mode``
by shortening the jumper JP1.
The second option is to attach a :ref:`jlink-external-debug-probe` to the
10-pin SWD connector (J10) of the board. Additionally, the jumper JP4 must
be shortened.
For both options use the ``-r jlink`` option with west to use the jlink runner.

.. code-block:: console

   west flash -r jlink

Configuring a Console
=====================

Connect a USB cable from your PC to J13, and use the serial terminal of your choice
(minicom, putty, etc.) with the following settings:

- Speed: 115200
- Data: 8 bits
- Parity: None
- Stop bits: 1

Flashing
========

Here is an example for the :zephyr:code-sample:`hello_world` application.

.. zephyr-app-commands::
   :zephyr-app: samples/hello_world
   :board: frdm_k32l2b3
   :goals: flash

Open a serial terminal, reset the board (press the SW1 button), and you should
see the following message in the terminal:

.. code-block:: console

   *** Booting Zephyr OS build v3.6.0-4475-gfa5bd8bb098e ***
   Hello World! frdm_k32l2b3/mcxc444

Debugging
=========

Here is an example for the :zephyr:code-sample:`hello_world` application.

.. zephyr-app-commands::
   :zephyr-app: samples/hello_world
   :board: frdm_k32l2b3
   :goals: debug

Open a serial terminal, step through the application in your debugger, and you
should see the following message in the terminal:

.. code-block:: console

   *** Booting Zephyr OS build v3.6.0-4475-gfa5bd8bb098e ***
   Hello World! frdm_k32l2b3/mcxc444

.. include:: ../../common/board-footer.rst
   :start-after: nxp-board-footer

.. _MCX C14x/24x/44x Website:
   https://www.nxp.com/products/processors-and-microcontrollers/arm-microcontrollers/general-purpose-mcus/mcx-arm-cortex-m/mcx-c-series-microcontrollers/mcx-c14x-24x-44x-mcus-with-arm-cortex-m0-plus-entry-level-mcus-with-usb-segment-lcd-and-classical-peripherals:MCX-C14x-24x-44x

.. _MCX C44x Datasheet:
   https://www.nxp.com/docs/en/data-sheet/MCXC44XP64M48SF6.pdf

.. _MCX C44x Reference Manual:
   https://www.nxp.com/webapp/Download?colCode=MCXC44XP64M48RM

.. _FRDM-MCXC444 Website:
   https://www.nxp.com/design/design-center/development-boards-and-designs/general-purpose-mcus/frdm-development-board-for-mcx-c444-mcus:FRDM-MCXC444

.. _FRDM-MCXC444 User Manual:
   https://www.nxp.com/webapp/Download?colCode=UM12120

.. _FRDM-MCXC444 Design Files:
   https://www.nxp.com/webapp/Download?colCode=FRDM-MCXC444-DESIGNFILES
