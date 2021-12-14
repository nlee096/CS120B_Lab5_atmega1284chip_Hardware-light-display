# Test file for "Lab4_SMs" exercise 2


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0xFE
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

test "PINA: 0x00 =>  PORTB: 0x00"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
# Set expect values
expectPORTB 0x0
# Check pass/fail
checkResult
expect state RELEASE

test "PINA: 0x00 0x01 =>  PORTB: 0x00"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
# Set expect values
expectPORTB 0x01
# Check pass/fail
checkResult
expect state PRESS

test "PINA: 0x00 0x01 0x01 0x01 =>  PORTB: 0x01"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
setPINA 0xFE
continue 3
# Set expect values
expectPORTB 0x01
# Check pass/fail
checkResult
expect state PRESS

test "PINA: 0x00 0x01 0x00 0x01=>  PORTB: 0x03"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
# Set expect values
expectPORTB 0x03
# Check pass/fail
checkResult
expect state PRESS

test "PINA: 0x00 0x01 0x00 0x01 0x00 0x01=>  PORTB: 0x06"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
# Set expect values
expectPORTB 0x06
# Check pass/fail
checkResult
expect state PRESS

test "PINA: 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 =>  PORTB: 0x0C"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
# Set expect values
expectPORTB 0x0C
# Check pass/fail
checkResult
expect state PRESS

test "PINA: 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 =>  PORTB: 0x18"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
# Set expect values
expectPORTB 0x18
# Check pass/fail
checkResult
expect state PRESS

test "PINA: 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 =>  PORTB: 0x30"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
# Set expect values
expectPORTB 0x30
# Check pass/fail
checkResult
expect state PRESS

test "PINA: 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 =>  PORTB: 0x20"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
# Set expect values
expectPORTB 0x20
# Check pass/fail
checkResult
expect state PRESS

test "PINA: 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 =>  PORTB: 0x00"
# Set inputs
set state = Start
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
setPINA 0xFF
continue 1
setPINA 0xFE
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state PRESS

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n