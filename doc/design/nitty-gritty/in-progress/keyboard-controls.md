# Keyboard Controls

- Complete editing node: `ctrl+space`.
  - Note: This will be really uncomfortable unless caps-lock is set to ctrl.
  - Alternatives:
    - `enter` (doesn't work for editing multiline text)
    - `space, space` (this doesn't work for text where the dev will want to write consecutive spaces... though perhaps after understanding what the dev really wants in those cases, a better solution for that situation can be provided). Oh shoot- this probably wouldn't work for naming things where the dev wants to put extra space between two words in the name...

- Insert keyword: `;`.

- Note: switching between single-line and multi-line display is done automatically. I don't currently see a need to allow manual override.

- TODO: I need to decide whether the function call chaining visual directionality should be allowed to be controlled on a call-site basis, or configured as an attribute of the function.
  - I like that the attribute option is the simplest in that it doesn't create many aesthetic choices for the dev