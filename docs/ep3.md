# Numeric Operations

Numeric operations use the same symbols as any programming language.

## Contents

- [Overflow Concept](#overflow-concept)
  - [Negative Overflow](#negative-overflow)
- [Bit operations](#bit-operations)
- [Comparison](#comparison)
- [Type coercions, casting and conversion](#type-coercions-casting-and-conversion)
- [More numeric operations (builtin)](#more-numeric-operations-builtin)
- [More STD Math numeric operations](#more-stdmath-numeric-operations)

## Overflow Concept

An addition of numbers resulting in a bigger value than its type results in a overflow error.

```zig
const two_fifty: u8 = 250;
const two: u8 = 2;
const one: u8 = 1;

// ! Overflow
result = two_fifty * two;
 
// * Wrapping -> - When max reached, start counting from min
result = two_fifty *% two;

// * Saturating -> - Stop counting on max range
result = two_fifty *| two;

// * Wrapping -> - When min reached, start counting from max
result = zero -% one;

// * Saturating - Stop counting on min range
result = zero -| one;
```

### Negative overflow

```zig
// i8 => (-128 - 127)
const neg_number: i8 = -120;
-%neg_number // -(-120) = +120

const neg_number_b: i8 = -128; 
-%neg_number_b // -(-128) = -128 (min of range)
```

## Bit operations

```zig
// * Shifts
_ = 1 << 2;
_ = 1 <<| 2;
_ = 32 >> 2;

// * Bit Operations
_ = 32 | 2; // OR
_ = 32 & 1; // AND
_ = 32 ^ 0; // XOR
const bit: u8 = 0b0000_0001; // 1
_ = ~bit; // 0 - NOT
```

## Comparison

```zig
_ = 3 < 9;
_ = 3 <= 9;
_ = 3 > 9;
_ = 3 >= 9;
_ = 3 == 9;
_ = 3 != 9;
```

## Type coercions, casting and conversion

```zig
// Type coerce when it's safe
const byte: u8 = 200;
const word: u16 = 999;
const sum: u32 = byte + word; 
// u8 + u16 = u24 > u32 (Safe)
```

```zig
// Type Casting
const word_1: u64 = 5;
const word_2: u16 = @intCast(word_1);
std.debug.print("word_2: {}\n", .{word_2});
```

```zig
// Type conversion
var a_float: f32 = 3.1415;

// Removes decimals
const an_int: i32 = @intFromFloat(a_float); 

a_float = @floatFromInt(an_int);
```

## More numeric operations builtin

- @addWithOverflow
- @mulWithOverflow
- @mod
- @rem
- @fabs
- @sqrt
- @min
- @max
- Etc...

## More std.math Numeric operations

- std.math.add,
- std.math.sub,
- std.math.divExact,
- Etc...
