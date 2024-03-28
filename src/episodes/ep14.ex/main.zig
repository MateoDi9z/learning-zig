const std = @import("std");

const Point = @import("point.zig").Point;

pub fn main() !void {
    const P = Point(f16);

    const a_point = P.new(0, 0);
    const b_point = P.new(1, 1);

    std.debug.print("distance: {d:.1}\n", .{a_point.distance(b_point)});
    std.debug.print("type of a_point: {}\n", .{@TypeOf(a_point)});
}
