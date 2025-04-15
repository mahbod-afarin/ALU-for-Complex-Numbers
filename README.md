# ALU-for-Complex-Numbers

This experiment involves implementing and testing various components required to construct a simple, custom computer architecture. The final system uses a memory unit with 32 words.

### 🧱 Modules to Implement

#### ➕ A. Complex Number Addition and Subtraction
- Design a module that supports both addition and subtraction of complex numbers.
- Input: Two complex numbers
- Output: Sum or difference

#### ✖️ B. Complex Number Multiplication
- Design a module to multiply two complex numbers.
- Ensure proper handling of real and imaginary parts.

#### 📥 C. Pipelined Execution Unit
- Build a pipelined unit to:
  - Fetch instructions from the 32-word memory.
  - Execute complex operations in a pipelined fashion.
- The unit must support streaming execution without stalling.

---

## ⚙️ ALU Pipeline Module

In this experiment, an **ALU module** was designed and implemented to perform arithmetic operations including **addition**, **subtraction**, and **multiplication** in a **pipelined** manner.

### 🧠 Execution Pipeline

Each operation is executed over **two clock cycles**, as follows:

- **First Clock Cycle**:
  - Inputs `op1`, `op2`, and `opcode` are stored into registers `op1Reg`, `op2Reg`, and `opcReg`.

- **Second Clock Cycle**:
  - Based on the `opcReg`, the specified operation is performed using the values in `op1Reg` and `op2Reg`.
  - The result is stored in `out`.

If the provided `opcode` is invalid (i.e., equals `0`), the output flag `valid` is set to `0`. Otherwise, `valid` is set to `1`, indicating the operation was successful.

This pipelining allows **concurrent instruction execution**: while one operation is being processed, the next instruction is loaded into the pipeline.

> 🌀 Therefore, each input appears at the output **with a delay of two clock cycles**.

### 🔁 Reset Functionality

The module also includes an **asynchronous reset** signal. When reset is triggered:
- All registers are cleared.
- The ALU execution restarts from the beginning once reset returns to `0`.

### 🧪 Testbench Details

A test module was created to verify functionality:

- After a **reset** at 2 milliseconds:
  1. An **addition** of `5 + 21` is issued.
  2. After a delay of 10 ms, a **subtraction** of `24 - 11` is issued.
  3. After another 10 ms delay, a **multiplication** of `12 × 11` is issued.

### 📈 Result Verification

As shown in the waveform output:
- The result of each operation appears in the `out` signal exactly **two clock cycles** after being issued, confirming correct pipelined behavior.

