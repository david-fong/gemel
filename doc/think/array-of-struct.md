# Array of Structs

Options for the language grammar:

- Allow for the struct to define how to separate lanes when in an array
  - This method is good for one-off classes (only used in one place for a specific purpose).
  - This somewhat falls apart when considering non-one-off cases, where one could have structs inside structs and possibly want to also control lanes for the inner struct.
- Allow the declaration of the array-of-structs to choose how to separate lanes


## Things to make sure to think about

- What about structs inside a struct?
  - How would this work if the inner struct has complex destructor logic (would that make things more complex? or would it be the same?)?