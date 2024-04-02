// Blocks and switch

const std = @import("std");

pub fn main() !void {
    std.log.info("All your codebase are belong to us.", .{});

    // A block defines a new scope
    {
        const a = 5;
        std.debug.print("a = {}\n", .{a});
    }

    // a is not defined in <- this scope

    // blocks are expressions with a label that return a value
    const x: u8 = block: {
        const y: u8 = 13;
        const z = 42;
        break :block y + z;
    };
    std.debug.print("x = {}\n", .{x});

    switch (x) {
        0...20 => std.debug.print("A", .{}),
        21, 22, 23 => std.debug.print("B", .{}),
        40...60 => |a| std.debug.print("a: {}", .{a}),
        77 => {
            // block
            std.debug.print("A", .{});
        },
        // block has to be comptime known
        block: {
            const a = 100;
            const b = -50;
            break :block a + b;
        } => std.debug.print("a + b"),

        else => std.debug.print("Else...", .{}),
    }

    const answer: u8 = switch (x) {
        0...10 => 1,
        20...50 => 2,
        else => 3,
    };
    std.debug.print("Answer: {}", .{answer});
}
