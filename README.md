# Formal Verification Course

This repository contains solutions and models for various problems in the Formal Verification course at FAU. Each model uses either Promela for SPIN or NuSMV for formal verification tasks.

## Contents

- `hanoi.smv`: NuSMV model for solving the Towers of Hanoi problem.
- `river.pml`: Promela model for the River Puzzle II problem.
- `spinflew.pml`: Promela model for solving a 7x7 grid number puzzle.
- `counter_v0.pml`: Promela model for a distributed counting problem with race conditions.
- `flewfree4houses.smv`: NuSMV model for solving constraints related to house arrangements.
- `stack.smv`: NuSMV model for verifying properties of a stack.

---

## Problem Descriptions

### 1. Towers of Hanoi (`hanoi.smv`)
The Towers of Hanoi is a classic problem in which discs of decreasing size are stacked on one tower, and the task is to move them to another tower under the following constraints:
- Only one disc can be moved at a time.
- A disc cannot be placed on a smaller disc.

The NuSMV model checks if the state transitions in solving this problem satisfy the problem's constraints.

---

### 2. River Puzzle II (`river.pml`)
Three actors and their agents need to cross a river using a boat with limited capacity. The problem constraints are:
- The boat can hold a maximum of two people at a time.
- An actor cannot remain with another agent unless their own agent is present.

This Promela model simulates the problem and uses LTL properties to ensure the constraints are upheld. The file includes instructions for generating solution traces.

---

### 3. Number Puzzle on a 7x7 Board (`spinflew.pml`)
This problem involves a 7x7 grid where certain cells are labeled with numbers from 1 to 11. The goal is to place stones sequentially, starting with the lowest number, and cover the grid following these rules:
- Each new stone must be placed adjacent to the previous one.
- Numbered cells must be visited in increasing order.

#### Board Description:
The grid is modeled as a one-dimensional array of size 49. Each cell in the array corresponds to a position on the 7x7 board. Example:

| A | B | C | D | E | F | G |
|---|---|---|---|---|---|---|
|   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |
|   |   |   | 10|   |   |   |
|   |   |   | 11|  9|   |   |
|   |   |   |  8|   |   |   |

The model ensures that all constraints are satisfied while simulating possible moves on the grid.

---

### 4. Distributed Counting (`counter_v0.pml`)
This Promela model simulates a distributed counting system where processes at different gates increment a shared global counter. Due to the lack of synchronization, race conditions can lead to inconsistencies in the counter's final value. This model investigates:
- The minimum possible counter value after all updates.
- Traces that lead to the final counter value.

---

### 5. House Arrangement Problem (`flewfree4houses.smv`)
This NuSMV model solves a logical problem involving arranging houses under specific constraints. The constraints include:
- Relationships between houses.
- Characteristics that must hold true (e.g., colors, occupants, or positions).

---

### 6. Stack Verification (`stack.smv`)
This model uses NuSMV to verify properties of a stack. The task is to fill in the missing CTL and LTL specifications based on provided descriptions while ensuring the integrity of stack operations like push and pop.

---

## Instructions

### Running Promela Models
1. Install [SPIN](http://spinroot.com/).
2. Load the `.pml` files into SPIN.
3. Use SPIN to verify LTL properties or generate solution traces.

### Running NuSMV Models
1. Install [NuSMV](http://nusmv.fbk.eu/).
2. Run the `.smv` files with NuSMV.
3. Check the output to validate state transitions and property specifications.

---

## Contributing
Feel free to submit issues or pull requests to improve the models or add documentation.

---

Happy modeling!

