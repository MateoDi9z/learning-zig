// Bool & Optionals

const std = @import("std");

pub fn main() !void {
    std.log.info("All your codebase are belong to us.", .{});

    // uint or null
    var t: ?u8 = null;

    std.debug.print("t: {?}", .{t});
    t = 42;
    std.debug.print("t: {?}", .{t});

    // Throw Error if null
    var the_byte = t.?;

    // if null 12 else t
    the_byte = t orelse 12;

    if (t) {
        std.debug.print("It's {}!\n", .{t});
    } else if (false) {
        std.debug.print("What?n {}!\n", .{t});
    } else {
        std.debug.print("What?n {}!\n", .{t});
    }

    // capture value of t exp in b
    if (t) |b| {
        std.debug.print("b is {}!\n", .{b});
    } else {
        //
    }

    // ignore capture
    if (true) |_| {
        //
    }

    // ternary op
    t = if (true) |b| b else 0;
    t = true orelse 0; // shorter and same

    // Multi line and multi condition
    the_byte = if (t != null and t.? == 42)
        42 * 2
    else
        0;
}
