// Constants and variables

const std = @import("std");

//? Constants and variables are snake_case
//* Global Constant
const global_const: u8 = 42;

//* Global Variable
var global_var: u8 = 0;

//? Functions are camelCase
fn printInfo(name: []const u8, x: anytype) void {
    std.debug.print("{s:>10} {any:^10}\t{}\n", .{ name, x, @TypeOf(x) });
}

pub fn main() !void {
    std.debug.print("{s:>10} {s:^10}\t{s}\n", .{ "name", "value", "type" });
    std.debug.print("{s:>10} {s:^10}\t{s}\n", .{ "----", "-----", "----" });

    // `const` defines an immutable value accessed via the name `a_const`
    const a_const = 57;
    // a_const += 1;
    printInfo("a_const", a_const);

    var a_var: u8 = 2;
    a_var += 1;
    printInfo("a_var", a_var);

    // ! Type must be specified
    // var x = 22;

    // ! Value must be specified
    // var x: u8;
    // const x: u8;

    var b_var: u8 = undefined;
    // ? Must be mutated if declared undefined
    b_var = 1;
    printInfo("b_var", b_var);

    // ! Unused defined variables throw error unless use of `_`, ex:
    // _ = a_const;

    var f_var: u1 = 0;
    printInfo("f_var", f_var);
    f_var += 1;
    printInfo("f_var", f_var);

    // ! Integer Overflow, u1 is 1 bit, 2 = 0b10 (2 bits)
    // f_var += 1;

    const g_const: u21 = '🔥';
    printInfo("g_const", g_const);

    //* Floats
    const h_const = 123.0E+77;
    printInfo("h_const", h_const);

    //* Special Values
    const i_const = -std.math.inf(f64);
    printInfo("i_const", i_const);
}
