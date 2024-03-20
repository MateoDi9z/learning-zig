const std = @import("std");

// Sum a + b
fn add(a: u8, b: u8) u8 {
    return a +| b;
}

// print a u8 and return void
fn printU8(n: u8) void {
    std.debug.print("{}", .{n});
}

// Throw error and never returns
fn oops() noreturn {
    @panic("Oops!");
}

// If a function is never called, it isn't even evaluated
fn never() void {
    @compileError("Never happens...");
}

// A `pub` function can be imported from another namespace.
pub fn sub(a: u8, b: u8) u8 {
    return a -| b;
}

// An `extern` function is linked in from an external object file.
extern "c" fn atan2(a: f64, b: f64) f64;

// An `export` function is made available for use in the generated object file.
export fn mul(a: u8, b: u8) u8 {
    return a *| b;
}

// Force a function to inlined, usually unnecesary.
inline fn answer() u8 {
    return 42;
}

// Parameters are always constant and zig determines whether to pass by value or by reference
fn addOneNot(n: u8) void {
    n += 1; // ! Error, params are const
}

// If you wand to modify the parameter inside the function, make it ptr.
fn addOne(n: *u8) void {
    n.* += 1; // * OK
}

pub fn main() !void {
    std.debug.print("\n", .{});

    var n: u8 = 9;

    addOne(&n);
    std.debug.print("n: {} \n", .{n});
}
