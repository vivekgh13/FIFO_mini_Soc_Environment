# FIFO Design & Verification (SystemVerilog)

This project implements and verifies a synchronous FIFO (First-In First-Out) using a modular SystemVerilog testbench architecture. It focuses on validating data integrity, pointer behavior, and corner-case scenarios using transaction-based verification.

# Components Overview
# Write Agent (write_ag)
wr_gen.sv → Generates write transactions
wr_bfm.sv → Drives signals to DUT
wr_mon.sv → Observes write activity
# Read Agent (read_ag)
rd_gen.sv → Generates read transactions
rd_bfm.sv → Drives read interface
rd_mon.sv → Captures read data
rd_cov.sv → Functional coverage for read operations
# Agents
wr_agent.sv → Integrates write generator, BFM, monitor
rd_agent.sv → Integrates read components
# Environment
env.sv
Instantiates agents
Connects mailboxes
Coordinates overall simulation
# Scoreboard
sbd.sv
Compares expected vs actual FIFO data
Ensures data integrity and ordering
# Transactions
Located in /transactions
Defines transaction class (e.g., fifo_tx) used across generator, BFM, monitor
# Top
top.sv
Instantiates DUT + testbench
Starts simulation
# Features
Parameterized FIFO (depth & width)
Separate read/write agents
Mailbox-based communication
Modular and scalable testbench
Functional coverage support
Debug-friendly logs
# Verification Strategy
Constrained/random stimulus generation

Transaction flow:

Generator → Mailbox → BFM → DUT → Monitor → Scoreboard
Scoreboard validates:
FIFO ordering (FIFO property)
Data correctness
Read/write synchronization
# Test Scenarios
FIFO full & empty conditions
Simultaneous read/writections
Back-to-back read/write stress cases
# Tools Used
Simulator: QuestaSim / ModelSim
Language: SystemVerilog
