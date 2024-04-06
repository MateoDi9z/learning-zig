// Testing

const std = @import("std");
const testing = std.testing;

// Test other file tests
test {
    _ = @import("arithmetic.zig");
}

const Foo = struct {
    a: bool,
    b: u8,
    c: []const usize,
    d: []const u8,

    fn new(flag: bool) Foo {
        return if (flag) .{ .a = true, .b = 1, .c = &[_]usize{ 4, 5, 6 }, .d = "Hello" } else .{ .a = false, .b = 0, .c = &[_]usize{ 1, 2, 3 }, .d = "Bye" };
    }

    // You can have tests in any container
    test "test inside Foo" {
        if (true) {
            return error.SkipZigTest; // Skip this test case
        }
        try testing.expect(true);
    }
};

test "new Foo: true" {
    const foo = Foo.new(true);
    try testing.expect(foo.a); // expect true
    try testing.expectEqual(@as(u8, 1), foo.b); // expect 1
    try testing.expectEqualSlices(usize, &[_]usize{ 4, 5, 6 }, foo.c); // expect same slice
    try testing.expectEqualStrings("Hello", foo.d); // expect string
}

const Error = error{Boom};

fn harmless() Error!void {
    return error.Boom;
}

const skip_flag = true;
test "explosive error" {
    _ = skip_flag or return error.SkipZigTest; // if skip_flag is false, skip test
    try testing.expectError(error.Boom, harmless()); // test for error
}

pub fn main() !void {}
