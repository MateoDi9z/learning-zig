// Structs

const std = @import("std");

// You can declare all these in another file and use const Point = @This(); to create a struct
// const Point = @import("Point.zig"); // Then import it

const Point = struct {
    x: f32,
    y: f32 = 0,

    fn new(x: f32, y: f32) Point {
        return .{ .x = x, .y = y };
    }

    fn distance(self: Point, other: Point) f32 {
        const diffx = other.x - self.x;
        const diffy = other.y - self.y;
        return @sqrt(diffx * diffx + diffy * diffy);
    }
};

const Namespace = struct {
    const pi: f64 = 3.141592;
    var count: usize = 0;
};

pub fn main() !void {
    std.debug.print("\n\n", .{});

    const a_point: Point = .{ .x = 0 };
    const b_point = Point.new(1, 1);

    std.debug.print("distance: {d:.1}\n", .{a_point.distance(b_point)});

    std.debug.print("distance: {d:.1}\n", .{Point.distance(a_point, b_point)});

    std.debug.print("\n", .{});

    std.debug.print("size of Point: {}\n", .{@sizeOf(Point)});
    std.debug.print("size of Namespace: {}\n", .{@sizeOf(Namespace)});

    std.debug.print("\n", .{});

    var c_point = Point.new(0, 0);
    setYBasedOnX(&c_point.x, 42);
    std.debug.print("c_point.y: {d:.1}\n", .{c_point.y});

    std.debug.print("\n", .{});

    const c_point_ptr = &c_point;
    std.debug.print("c_point_ptr.y: {d:.1}, c_point_ptr.*.y: {d:.1}\n", .{ c_point_ptr.y, c_point_ptr.*.y });
}

fn setYBasedOnX(x: *f32, y: f32) void {
    const point = @fieldParentPtr(Point, "x", x);
    point.y = y;
}
