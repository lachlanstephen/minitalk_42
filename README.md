<h1>minitalk</h1>

<h3>Mark: 115/100</h3>

`minitalk`, a project in ring 2 of the 42 Cursus, is one of the introductory projects for the bigger UNIX projects later in the cursus. Students had the choice between `minitalk` and `pipex`. The purpose of `minitalk` is to code a small data exchange program using UNIX signals, by means of a client server communication program.

<h3>Running the program</h3>

<p>To compile and run the program, run the following commands:</p>

```bash

# Make using the Makefile

make	# Creates the server and client executables

# Run the server executable

./server	# Prints PID of the server, and keeps program running

# In a separate terminal, run the client executable, using the following arguments

./client <server_pid> <string_to_send>

# e.g. ./client 3855 "Hello, world!"
```

<i>Note</i>: The bonus marks came from unicode character support (emojis). Feel free to replace the `<string_to_send>` with whichever characters you'd like to test.

<h3>Plan for repository</h3>

- [ ] Complete remaining bonus - Server acknowledgement of message
- [ ] Re-evaluate project with bonuses

<h3>Personal Note</h3>

<p>I personally really enjoyed this project. The UNIX signals we were allowed to use only could communicate a 1 or 0, so the idea of breaking down strings and characters into their bit form to capitalise on the limiations of the signals to send to a separate terminal window was very interesting. Getting to use bitwise comparisons and operators to make this happen, which is slightly closer to some maths than other tasks, was also good fun.</p>
