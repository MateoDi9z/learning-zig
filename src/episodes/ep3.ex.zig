const std = @import("std");

pub fn main() !void {
    std.log.info("All your codebase are belong to us.", .{});

    const two_fifty: u8 = 250;
    const two: u8 = 2;
    const one: u8 = 1;
    const zero: u8 = 0;

    var result = zero + two - one * two / one % 2;

    // ! Overflow
    // result = two_fifty * two;

    // * Wrapping -> - When max reached, start counting from min
    result = two_fifty *% two;
    std.debug.print("*% result: {}\n", .{result});

    // * Saturating -> - Stop counting on max range
    result = two_fifty *| two;
    std.debug.print("*| result: {}\n", .{result});

    // * Wrapping -> - When min reached, start counting from max
    result = zero -% one;
    std.debug.print("-% result: {}\n", .{result});

    // * Saturating - Stop counting on min range
    result = zero -| one;
    std.debug.print("-| result: {}\n", .{result});

    const neg_number: i8 = -120;
    std.debug.print("-% -120 i8 result: {}\n", .{-%neg_number}); // -(-120) = +120

    const neg_number_b: i8 = -128; // i8 => (-128 - 127)
    std.debug.print("-% -128 i8 result: {}\n", .{-%neg_number_b}); // -(-128) = -128 (min of range)

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

    // * Comparison
    _ = 3 < 9;
    _ = 3 <= 9;
    _ = 3 > 9;
    _ = 3 >= 9;
    _ = 3 == 9;
    _ = 3 != 9;

    // * Type coerce when it's safe
    const byte: u8 = 200;
    const word: u16 = 999;
    const dword: u32 = byte + word; // u8 + u16 = u24 > u32 (Safe)
    std.debug.print("dword: {}\n", .{dword});

    // * Type Casting
    const word_2: u16 = @intCast(dword);
    std.debug.print("word_2: {}\n", .{word_2});

    // * Type conversion
    var a_float: f32 = 3.1415;
    std.debug.print("a_float: {}\n", .{a_float});
    const an_int: i32 = @intFromFloat(a_float); // Removes decimals
    std.debug.print("an_int: {}\n", .{an_int});
    a_float = @floatFromInt(an_int);
    std.debug.print("a_float: {}\n", .{a_float});

    // Numeric operations builtin
    // @addWithOverflow, @mulWithOverflow, @mod, @rem, @fabs, @sqrt, @min, @max, etc...

    // std.math Numeric operations
    // std.math.add, std.math.sub, std.math.divExact, etc...
}
