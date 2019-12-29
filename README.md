# Single-Cycle Implementation of CPU with Verolig

This project offers a simple implementation of a single-cycle CPU in verlog.


## Authors

* **Alireza Majari** - [ALI-P48](https://github.com/ALI-P48)
* **Mohammad Hossein Hatefi** - [mhatefi1](https://github.com/mhatefi1)


## License

This project is licensed under the GPLv2 License - see the [LICENSE.md](LICENSE.md) file for details


## Datapath diagram:

![](http://github.com/mhatefi1/cpuverilog/master/images/blur.bmp)

## Tables:
### Control:
![](http://github.com/mhatefi1/cpuverilog/master/pics/control)
### ALU Control:
![](http://github.com/mhatefi1/cpuverilog/master/pics/alu-control)
### ALU Operation:
![](http://github.com/mhatefi1/cpuverilog/master/pics/alu-operation)


## Modules:

* [cpu.v](https://github.com/mhatefi1/cpuverilog/blob/master/cpu.v) - Testbench and the main modules of project
* [pc.v](https://github.com/mhatefi1/cpuverilog/blob/master/pc.v) - Program Counter module 
* [instruction_memory.v](https://github.com/mhatefi1/cpuverilog/blob/master/instruction_memory.v)
* [reg_bank.v](https://github.com/mhatefi1/cpuverilog/blob/master/reg_bank.v)
* [memory.v](https://github.com/mhatefi1/cpuverilog/blob/master/memory.v)
* [alu.v](https://github.com/mhatefi1/cpuverilog/blob/master/alu.v)
* [alu-control.v](https://github.com/mhatefi1/cpuverilog/blob/master/alu-control.v)
* [clock.v](https://github.com/mhatefi1/cpuverilog/blob/master/clock.v)
* [mlti.v](https://github.com/mhatefi1/cpuverilog/blob/master/mlti.v)
* [imgen.v](https://github.com/mhatefi1/cpuverilog/blob/master/imgen.v)
* [cpu.v](https://github.com/mhatefi1/cpuverilog/blob/master/cpu.v)
