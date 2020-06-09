# Enigma
## Final Solo Project for Turing BE Module 1

### Functionality - Meets Expectations
Enigma Class with #encrypt and #decrypt have been successfully implemented.
Encrypt/decrypt command line interfaces have also been successfully implemented.

### Object Oriented Programming - Meets Expectations
The project is broken into logical components that are appropriately encapsulated.
Enigma class could have perhaps been broken down further but is not unreasonably large
Additionally Enigma does not contain knowledge/information/behavior that it shouldn’t know about.
It performs one basic function which is to shift letters along a character_set from a key, and it can do this forwards(#encrypt) and backwards(#decrypt).

### Ruby Conventions and Mechanics - Meet Expectations
Code is mostly properly indented, spaced, and lines are not excessively long.
Most methods are less than 10 lines long.
Class, method, variable, and file names follow convention.
Some enumerables/data structures could be the most efficient tool for a given job.
At least one hash is implemented in a way that makes logical sense.

### Test Driven Development - Meets Expectations
Every method is tested at both the unit and integration level, and completely verify expected behavior.
Addressed edge cases where not all arguments are provided.
Stubs were used effectively to make tests more robust.
git history and documentation demonstrates tests were written before implementation code.
Test coverage metrics show coverage at 100%.

### Version Control - Meets Expectations
There are 40+ commits and 5 merged branches.
All pull requests include related and logical chunks of functionality, and are named and documented to clearly communicate the purpose of the pull request.
Nearly all commits include single pieces of functionality and are concise and descriptive.
