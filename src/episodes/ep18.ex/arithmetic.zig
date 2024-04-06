const std = @import("std");
const testing = std.testing;

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    try testing.expect(add(2, 3) == 5);
}

pub fn sub(a: i32, b: i32) i32 {
    return a - b;
}

test "basic sub functionality" {
    try testing.expect(sub(3, 2) == 1);
}
