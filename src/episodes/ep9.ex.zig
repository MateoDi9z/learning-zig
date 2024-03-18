const std = @import("std");

pub fn main() !void {
    std.debug.print("\n", .{});
    var array = [_]u8{ 0, 1, 2, 3, 4, 5 };

    // Iterate over array
    for (array) |item| std.debug.print("{} ", .{item});
    std.debug.print("\n", .{});

    // or over slices
    for (array[0..3]) |item| std.debug.print("{} ", .{item});
    std.debug.print("\n", .{});

    // Add range to have an index
    for (array, 0..) |item, i| std.debug.print("i: {}, el: {}\n", .{ i, item });
    std.debug.print("\n", .{});

    // iterate over multiple slices, must be equal length
    for (array[0..2], array[1..3], array[2..4]) |a, b, c| {
        std.debug.print("{}-{}-{}\n", .{ a, b, c });
    }
    std.debug.print("\n", .{});

    // iterate over range
    for (3..10) |item| std.debug.print("{} ", .{item});
    std.debug.print("\n\n", .{});

    var sum: usize = 0;
    // break and continue
    for (array) |item| {
        if (item == 3) continue;
        if (item == 4) break;
        sum += item;
    }
    std.debug.print("sum: {}\n", .{sum});

    // use a label to break or continue from a nested loop
    sum = 0;
    outer: for (0..10) |oi| {
        for (1..3) |ii| {
            if (oi == 5) break :outer;
            sum += ii;
        }
    }
    std.debug.print("sum: {}\n\n", .{sum});

    // Obtein pointer to the item to modify it
    // Object can't be const and must use a pointer to modify
    // (Remember a slices is also a pointer type.)
    for (&array) |*item| {
        std.debug.print("{} -> ", .{item.*});
        item.* *= 2;
        std.debug.print("{} \n", .{item.*});
    }
    std.debug.print("\n", .{});

    // Array is now mutated
    std.debug.print("{any} \n", .{array});

    // A for loop can be an expression with an else clause
    // Here's how to obtein a slice of just the first non-null elements of an array of optionals
    const maybe_nums = [_]?u8{ 0, 1, 2, null, null };

    const just_nums = for (maybe_nums, 0..) |opt_nums, i| {
        // break with value returns value
        if (opt_nums == null) break maybe_nums[0..i];

        // if break never reached, then else executes
    } else maybe_nums[0..];
    std.debug.print("just_nums: {any} \n", .{just_nums});
}
