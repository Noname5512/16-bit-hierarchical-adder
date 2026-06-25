# 16-Bit Hierarchical Ripple Carry Adder (Verilog)

## Overview

This project implements a 16-bit Ripple Carry Adder (RCA) using a hierarchical design approach in Verilog. The design is built from basic Full Adder modules, which are combined to form a 4-bit Ripple Carry Adder. Four 4-bit RCAs are then connected together to create a complete 16-bit adder.

In addition to performing addition, the design generates common status flags such as Sign, Zero, Parity, and Overflow.

## Design Hierarchy

```text
Full Adder
    ↓
4-bit Ripple Carry Adder
    ↓
16-bit Ripple Carry Adder
```

### Full Adder

The Full Adder is implemented using basic logic gates:

* XOR gates for sum generation
* AND gates for carry generation
* OR gate for carry propagation

Inputs:

* `a`
* `b`
* `cin`

Outputs:

* `sum`
* `cout`

### 4-bit Ripple Carry Adder

The 4-bit RCA consists of four Full Adder instances connected in series. The carry output from each stage is connected to the carry input of the next stage.

Inputs:

* `a[3:0]`
* `b[3:0]`
* `cin`

Outputs:

* `sum[3:0]`
* `cout`

### 16-bit Ripple Carry Adder

The 16-bit adder is constructed by cascading four 4-bit RCAs.

Inputs:

* `a[15:0]`
* `b[15:0]`
* `cin`

Outputs:

* `sum[15:0]`
* `cout`
* `sign`
* `zero`
* `parity`
* `overflow`

## Status Flags

### Sign Flag

Indicates the sign of the result.

```verilog
sign = sum[15];
```

### Zero Flag

Asserted when the result is zero.

```verilog
zero = ~|sum;
```

### Parity Flag

Indicates even parity of the result.

```verilog
parity = ~^sum;
```

### Overflow Flag

Detects signed arithmetic overflow.

```verilog
overflow = (a[15] & b[15] & ~sum[15]) |
           (~a[15] & ~b[15] & sum[15]);
```

## Simulation

The project includes a Verilog testbench that:

* Applies multiple test vectors
* Displays inputs and outputs using `$monitor`
* Generates a VCD waveform file for viewing in GTKWave or other waveform viewers

Example simulation command:

```bash
iverilog -o sim tb_adder16bit.v adder16bit.v
vvp sim
```

Waveform generation:

```verilog
$dumpfile("adder16bit.vcd");
$dumpvars(0, tb_adder16bit);
```

## Learning Objectives

This project demonstrates:

* Structural Verilog modeling
* Hierarchical hardware design
* Ripple carry propagation
* Multi-bit arithmetic circuit construction
* Status flag generation
* Testbench creation and simulation
* Waveform-based debugging

## Future Improvements

Possible extensions include:

* Carry Lookahead Adder (CLA)
* Carry Select Adder (CSA)
* 16-bit Arithmetic Logic Unit (ALU)
* Parameterized N-bit Adder
* Signed and unsigned operation support
* Comprehensive self-checking testbench

## Author

Built as a learning project to practice hierarchical Verilog design and digital hardware modeling.
