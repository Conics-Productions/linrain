# INRain

A super simple beginner scripting language — a mix of batch/shell and Python.
Runs `.inr` and `.inrain` files. Made to work off a USB drive, on Linux, or macOS.

## Requirements
- Python 3 installed on the machine (get it from python.org on Windows, or
  use your package manager on Linux/macOS — e.g. `sudo apt install python3`)
- tkinter for GUI commands:
  - macOS: bundled with Python automatically
  - Linux: usually a separate package, e.g. `sudo apt install python3-tk`

## Setup (one time per computer)
### Linux / macOS
1. Copy the whole `INRain` folder onto your USB drive (or anywhere on disk).
2. Open a terminal and `cd` into the INRain folder:
   ```
   cd /path/to/INRain
   ```
3. Make the scripts executable and run setup once:
   ```
   chmod +x INRain.sh setup_inrain.sh
   ./setup_inrain.sh
   ```
   This installs a small `INRain` wrapper into `~/.local/bin` and adds it to
   your PATH (editing `~/.bashrc`, `~/.zshrc`, or `~/.profile` as needed).
   Close and reopen your terminal, or run `source ~/.bashrc` (or the
   equivalent for your shell), afterwards.
4. Run scripts with:
   ```
   INRain myscript.inr
   ```
   Or, without running setup, from inside the folder:
   ```
   ./INRain.sh myscript.inr
   ```

> Note: if you move the USB drive to a different mount path, re-run
> `setup_inrain.sh` (Linux/macOS) or `setup_inrain.bat` (Windows) so the
> wrapper points at the new location.

## The INRain Language

### Print text
```
print Hello World!
```

### Variables
```
set name = Bob
print Hello, {name}!
```
Use `{variable}` anywhere in text to insert a variable's value.

### Math
```
set x = 5
add x 3        REM x is now 8
sub x 1        REM x is now 7
mul x 2        REM x is now 14
div x 7        REM x is now 2
```

### Ask the user for input (text-based)
```
ask name What is your name?
print Nice to meet you, {name}!
```

### If / Else
```
if age >= 18:
    print You are an adult!
else:
    print You are a minor!
end
```
Works with `==`, `!=`, `>`, `<`, `>=`, `<=`

### Loops
```
loop 5:
    print Looping!
end
```
```
set count = 0
while count < 3:
    print count is {count}
    add count 1
end
```

### Wait / pause
```
wait 2      REM waits 2 seconds
```

### Run a real shell command
```
run dir            REM Windows
run ls -la         REM Linux/macOS
run echo hello
```
This is passed straight to the system shell (`cmd` on Windows,
`/bin/sh` on Linux/macOS), so use whatever commands your OS understands.

### Clear the screen
```
clear
```

### Comments
```
REM this is ignored... actually use # instead:
# this is a comment
```

## GUI Commands (like tkinter, simplified)

### Open a window with text
```
gui Hello there!
```

### Add a button that runs a command when clicked
```
button Click Me -> print You clicked!
```

### Popup message box
```
popup This is a popup message!
```

### Popup text input box (GUI version of "ask")
```
input_box name What is your name?
print Hi {name}!
```

## Full Example
```
print Welcome to INRain!
ask name What is your name?
print Hello, {name}!

set age = 0
ask age How old are you?
if age >= 18:
    print You're an adult, {name}.
else:
    print You're still a minor, {name}.
end

gui Welcome, {name}!
button Say Hi -> popup Hi there!
button Close -> print Goodbye!
```

Save any of this as `myfile.inr` or `myfile.inrain` and run:
```
INRain myfile.inr
```
