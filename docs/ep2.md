# Episode 2 - Constants and variables

## Summary

In Zig, constants are defined using `const` keyword followed by type name and value.
Variables are defined using `var` keyword followed after type name and value.

Both constants and variables are snake_case.
Functions instead are camelCase

```zig
// Global Constant
const global_const: u8 = 42;

// Global Variable
var global_var: u8 = 0;
```

In both cases, value must be specified, otherwise use the `undefined` keyword, but don't forget to mutate the variable or it will throw an error.

Unused defined variables throw error unless use of `_`

## Contents

- [Summary](#summary)
- [Constants](#constants)
- [Variables](#variables)
- [Data Types](#data-types)
  - [Integers](#integers)
  - [Floating Points](#floating-points)
  - [Special Values](#special-values)

## Constants

`const` keyword defines an immutable value accessed via the name. Type does not have to be defined, it is inferred.

```zig
const a = 57;
```

in this case, the type of `a` will be `comptime_int`

## Variables

Variables must have an explicit type and its value is mutable.

```zig
var b: u8 = 2;
b += 1;
```

## Data Types

### Integers

- Unsigned: `u8`, `u16`, `u32`, `u64`, `u128`, `usize` (u(0-65535))
- Signed: `i8`, `i16`, `i32`, `i64`, `i128`, `isize` (i(0-65535))
- Literals can be decimal, binary, hex and octal, ex:

```zig
// underscore for readability
_ = 1_000_000;    // decimal
_ = 0x10ff_ffff;  // hex
_ = 0o777;        // octal
_ = 0b1110_1001;  // binary
```

Example of arbitrary size:

```zig
var f_var: u1 = 0;  // f_var = 0
f_var += 1;         // f_var = 1
f_var += 1;         // Error: Integer Overflow, u1 is 1 bit, 2 = 0b10 (2 bits)

const g_const: u21 = '🔥'; // u21 is used for emojis
```

- `comptime_int` is the type of integer literals

### Floating points

Types: `f16`, `f32`, `f64`, `f128`
Literals can be decimal or hex.

```zig
_ = 123.0E+77; // with exponent
_ = 123.0; // without exponent
_ = 123.0e+77; // E or e for exponent

_ = 0x123.0; // hex float
_ = 0x123.0P-5; // P or p for hex exponent

_ = 299_243.000_001; // Optional underscores for readability
```

### Special Values

Infinities and not a number

```zig
_ = std.math.inf(f64);   // positive infinity
_ = -std.math.inf(f64);  // negative infinity
_ = std.math.nan(f64);   // Not a Number
```

- `comptime_float` is the type of float literals
