Little Man Computer User Guide
==============================

**[Peter Higginson's LMC implementation](http://peterhigginson.co.uk/LMC/)** -
**[Help Page from Peter Higginson's LMC implementation](http://peterhigginson.co.uk/LMC/help.html)**

**I have also created a [GitHub repository](https://github.com/mbs-cs-2016/lmc-examples) dedicated to LMC examples.**

## Glossary

Knowing the definition of the following words is required to fully understand the User Guide.

<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>Word / Phrase</th>
            <th>Definition</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Accumulator</td>
            <td>Stores the result of the last operation or calculation.</td>
        </tr>
        <tr>
            <td>Program Counter</td>
            <td>Stores the memory location of the next operation to be executed.</td>
        </tr>
    </tbody>
</table>

## Basic Instructions

The following is a list of the basic instructions that can be performed on LMC.

<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>Instruction</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>HLT</td>
            <td>Signifies the end of the program.</td>
        </tr>
        <tr>
            <td>INP</td>
            <td>Waits for numeric input and stores it in the accumulator.</td>
        </tr>
        <tr>
            <td>OUT</td>
            <td>Outputs the contents of the accumulator.</td>
        </tr>
        <tr>
            <td>ADD</td>
            <td>Adds the contents of the given memory address to the accumulator.</td>
        </tr>
        <tr>
            <td>SUB</td>
            <td>Subtracts the contents of the given memory address from the accumulator.</td>
        </tr>
        <tr>
            <td>STA</td>
            <td>Stores the contents of the accumulator to the given memory address.</td>
        </tr>
        <tr>
            <td>LDA</td>
            <td>Loads the contents of the given memory address to the accumulator.</td>
        </tr>
        <tr>
            <td>DAT</td>
            <td>Stores the given value in the memory address of the instruction.</td>
        </tr>
    </tbody>
</table>

## Example (basic_calc)

Using the knowledge you've gained above, you should be able to build a simple calculator program like the one below:

```asm
    INP    # Waits for input and stores it in the accumulator
    STA 99 # Stores the contents of the accumulator to the memory address: 99 
    INP    # Waits for input and stores it in the accumulator
    ADD 99 # Add the contents of memory address: 99 to the accumulator
    OUT    # Outputs the contents of the accumulator
    HLT    # Signify the end of the program
```

## Labels

In larger programs, you may be storing lots of data, so using raw memory locations all over the place probably isn't the best of ideas. Labels 
solve this problem, and make you code neater at the same time.

Labels represents a memory address, and can be defined anywhere in your program.

### Representing an instruction (labels_basic)

Here we are using a label to represent the memory location of an instruction.

```asm
START INP    # Waits for input and stores it in the accumulator
      STA 99 # Stores the contents of the accumulator to the memory address: 99 
      INP    # Waits for input and stores it in the accumulator
      ADD 99 # Add the contents of memory address: 99 to the accumulator
      OUT    # Outputs the contents of the accumulator
      HLT    # Signify the end of the program
```

### Representing a memory location for data (labels_advanced)

Here we are using a label to represent the memory location of data.

```asm
START INP     # Waits for input and stores it in the accumulator
      STA NUM # Stores the contents of the accumulator to the memory address of the label: NUM
      INP     # Waits for input and stores it in the accumulator
      ADD NUM # Add the contents of memory address of the label: NUM to the accumulator
      OUT     # Outputs the contents of the accumulator
      HLT     # Signify the end of the program
NUM   DAT 1   # Defines the label: NUM as containing data, and sets it to a preset of 1
```

## Where next?

Eager to continue learning Little Man Computer? Check out my [extended User Guide](./advanced/).
