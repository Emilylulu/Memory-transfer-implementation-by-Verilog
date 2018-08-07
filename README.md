# Memory-transfer-implementation-by-Verilog
## Introduction
This project is targeted to implement a memory transfer block and test the timing diagram of it. The overall of the block diagram is shown below (Fig. 2.45 from Ref. [1]).  We divide the whole block into several modules: MEM_counter_A (Counter A and Memory A), MEM_counter_B (Counter B and Memory B), Controller, Add_Sub (all other parts, i.e. the middle part in the figure). We also write a test module to test the time diagram.
![fig2-45](https://user-images.githubusercontent.com/27938420/43806944-0c4bdff2-9a5b-11e8-83ad-0edfeb543e3e.png)
## Implementation
Implementation as 4 modules. MEM_counterA, Add_Sub, MEM_counterB, Controller. And onemore module is test module.
### MEM_counterA
MEM_counter_A module includes a three-bit counter - Counter A, and a memory block - Memory A. Counter A generates an address AddrA, which is current operation address of Memory A. AddrA is based on a reset signal, a clock signal and an enable signal IncA. Counter A will set AddrA to 0 when the reset signal and IncA are both low. When the reset signal is low and IncA is high, the address AddrA is incremented.

Memory A can operate on two modes: write mode and read mode, which is controlled by a memory write enable signal WEA. When WEA is high, a data from a data register DataInA will be stored in the address AddrA in Memory A. When WEA is low, a data stored in the address AddrA of Memory A is provided to a data register Dout1.
### Add_Sub
Add_Sub module represents a data path in the middle of the whole memory transfer block. Dout1 is the data from Memory A, updated by clock cycles. A D flip-flop generates a memory data output Dout2, which is the value of previous clock cycle Dout1. COMP compares Dout1 and Dout2 and provides a Sign signal to control a multiplexter MUX. Dout1 and Dout2 are sent to an adder to provide a sum ADDOut, as well as to a substractor to provide a difference SUBOut. Then MUX outputs ADDOut or SUBOut as another memory data input DataInB based on the Sign. If Dout2 is less than Dout1, Sign is 1 and MUX outputs ADDOut; if Dout2 is great than Dout1, Sign is 0 and MUX outputs SUBOut.
### MEM_counterB
Like MEM_counter_A, the MEM_counter_B module has a two-bit counter - Counter B and a memory block Memory B. Counter B generates an address AddrB, which is current operation address of Memory B. AddrB is based on a reset signal, a clock signal and an enable signal IncB. When the reset signal is high, AddrB is set to 0. When the reset signal is low and the enable signal IncB is high, AddrB is incremented.

Memory B also has operation modes: write mode and read mode, which is controlled by a memory write enable signal WEB. When WEB is high, a data in a data register DataInB is stored in AddrB of Memory B. When WEB is low, the written is disabled.
### Controller
![controller](https://user-images.githubusercontent.com/27938420/43807243-66a4d372-9a5c-11e8-8bc0-d25fa591cfaa.png)
we can get what should IncA, IncB, WEA, and WEB behave as clocks goes by. The following figure shows an implementation by Moore machine.
![fig2-47](https://user-images.githubusercontent.com/27938420/43807276-8e8c0b94-9a5c-11e8-91de-61c2b2c0890c.png)
### Test
The test module forms the other four modules, Reset, clock and DataInA. We select the clock as 200ps. We set Reset is 1 as an initial value, after 80ps, make Reset 0. And also initialize DataInA 8 bits all zeros. Every time wait 200ps, DataInA increase 1, until 8 times. 
## Target Output
![output](https://user-images.githubusercontent.com/27938420/43807319-c04f76c0-9a5c-11e8-9469-d58dfa6a74bc.png)
