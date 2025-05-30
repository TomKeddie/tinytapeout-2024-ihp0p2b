import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

@cocotb.test()
async def top(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())
    
    dut._log.info("reset")
    dut.rst_n.value = 0
    dut.rst.value = 1
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.rst.value = 0

    await ClockCycles(dut.clk, 16000)
