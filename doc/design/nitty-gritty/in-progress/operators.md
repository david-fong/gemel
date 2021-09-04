
# Operators

Let's use prefix notation! It will allow for fewer brackets and mostly rid ourselves and the devs from needing to know any rules about order of operations without brackets. Operators require a space after the operator name, and between each of the operands.

## Number Operators

`-` negates one number.

`+` adds two numbers. `+(` enables taking more than two operands.

`/` gives the reciprocal of a number... Or maybe... reciprocation could be a method on a float that takes a defaulter if the number is zero (and there could be a `recipOrDie` variant with no defaulter)? Wait... how would any of this work for integers?

`*` multiplies two numbers. `*(` enables taking more than two operands.

## Boolean Operators

`-` toggles the value.

`+` / `any` means the logical OR. Adding braces enables taking more than two operands.

`*` / `all` means the logical AND. Adding braces enables taking more than two operands.
