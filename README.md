# Ducky Script to C Transpiler
Translates Ducky Script to C that can be loaded onto an Arduino to operate as a cheap keyboard injector.

## Installation
### Windows
There is a Windows executable under the release section of this repository. It was built as a self contained stand alone executable and has no additional dependencies.
### Other Operating Systems
Download or clone the source and run the script `main.rb`.

## Usage
Giving the program a Ducky Script file as input will result in a C program that can be loaded into the Arduinio IDE and compiled and written to the Ardunio.
### Run Executable
Run the executable from the command prompt and pass it parameters, or drop the Ducky Script input file onto the executable.<br>
`ducky2arduino.exe <Input File Name> <Output File Name>`

### Run Script
Run the script from command prompt/terminal.<br>
`ruby main.rb <Input File Name> <Output File Name>`

### Parameters
The first argument `<Input File Name>` is required and points to the Ducky Script input file.<br><br>
The second argument `<Output File Name>` is optional. It is recommended to use `.c` as the extension for the argument name. If not present, the default will be the input file's name with a `.c` extension. Eg, `myScript.txt` becomes `myScript.c`.

## Notes
This project was written in Ruby2.4.4, so if you are running the script it may require a Ruby2.4 or later runtime to operate correctly.