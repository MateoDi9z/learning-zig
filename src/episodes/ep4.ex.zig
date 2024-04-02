// Arrays

const std = @import("std");

pub fn log(comptime fmt: []const u8, args: anytype) void {
    std.debug.print(fmt, args);
}

pub fn main() !void {
    //* Explicit type and length
    const a1: [5]u8 = [5]u8{ 1, 2, 3, 4, 5 };
    log("a1: {any}, a1.len: {}\n", .{ a1, a1.len });

    //* Inferred type and length
    const a2 = [_]u8{ 1, 2, 3, 4, 5 };
    log("a2: {any}, a2.len: {}\n", .{ a2, a2.len });

    // ** repeats am array
    const a3 = a2 ** 2;
    log("a3: {any}, a3.len: {}\n", .{ a3, a3.len });

    //* ...and can initialize it with a repeated value too.
    const a4 = [_]u8{0} ** 5;
    log("a4: {any}, a4.len: {}\n", .{ a4, a4.len });

    // ! Error - Array length must be defined before compile time
    // var x: u8 = 5;   //? may vary in compile time
    // const a5: [x]u8 = [_]u8{0} ** x;
    // log("a5: {any}, a5.len: {}\n", .{ a5, a5.len });

    //* You can leave the array as undefined and still use it later.
    var a6: [2]u8 = undefined;
    a6[0] = 1;
    a6[1] = 2;
    log("a6: {any}, a6.len: {}\n", .{ a6, a6.len });

    //* Multi-dimensional arrays
    const a7: [2][2]u8 = [_][2]u8{
        .{ 1, 2 },
        .{ 2, 3 },
    };
    log("a7: {any}, a7.len: {}\n", .{ a7, a7.len });

    //* Sentinel terminated arrays use [N:V]T syntax where N is the length and V is the sentinel value of type T.
    const a8: [3:0]u8 = .{ 1, 2, 3 };
    // [0] = 1, [1] = 2, [2] = 3 and [a8.len] = 0;
    log("a8: {any}, a8.len: {}\n", .{ a8, a8.len });
    log("a8[a8.len] == {}\n", .{a8[a8.len]});

    //* ++ concatenates arrays
    const a9 = a4 ++ a6;
    log("a9: {any}, a9.len: {}\n", .{ a9, a9.len });

    //* With ** you can call a function to initialize an array.
    const a10 = [_]u8{getSquare(3)} ** 3;
    log("a10: {any}, a10.len: {}\n", .{ a10, a10.len });

    //* Empty arrays
    _ = [0]u8{};
    _ = [_]u8{};
}

fn getSquare(x: u8) u8 {
    return x *| x;
}
