// While loop

const std = @import("std");

pub fn main() !void {
    std.debug.print("\n", .{});

    var i: usize = 0;
    // Basic while
    while (i < 3) {
        std.debug.print("{} ", .{i});
        i += 1;
    }
    std.debug.print("\n", .{});

    // Continue expression (One-liner while loop)
    i = 0;
    while (i < 3) : (i += 1) std.debug.print("{} ", .{i});
    std.debug.print("\n", .{});

    // Complex continue expression
    i = 0;
    var j: usize = 0;
    while (i < 3) : ({
        i += 1;
        j += 1;
    }) std.debug.print("{}-{} ", .{ i, j });
    std.debug.print("\n", .{});

    // While loop with blocks
    i = 0;
    outer: while (true) : (i += 1) {
        while (i < 10) : (i += 1) {
            if (i == 4) continue :outer;
            if (i == 6) break :outer;
            std.debug.print("{} ", .{i});
        }
    }
    std.debug.print("\n", .{});

    // While loop as expression
    const start: usize = 1;
    const end: usize = 20;
    i = start;
    const n: usize = 20;
    const in_range = while (i <= end) : (i += 1) {
        if (n == i) break true;
    } else false;
    std.debug.print("{} in [{}, {}]? {}\n", .{ n, start, end, in_range });

    // While with optional and capture
    count_down = 10;
    while (countDownIterator()) |num| std.debug.print("{} ", .{num});
    std.debug.print("\n", .{});
}

var count_down: usize = undefined;

fn countDownIterator() ?usize {
    return if (count_down == 0) null else blk: {
        count_down -= 1;
        break :blk count_down;
    };
}
