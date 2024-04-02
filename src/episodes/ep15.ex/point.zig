pub fn Point(comptime T: type) type {
    return struct {
        x: T,
        y: T = 0,

        const Self = @This();

        pub fn new(x: T, y: T) Self {
            return .{ .x = x, .y = y };
        }

        pub fn distance(self: Self, other: Self) f64 {
            const diffx: f64 = switch (@typeInfo(T)) {
                .Int => @floatFromInt(other.x - self.x),
                .Float => other.x - self.x,
                else => @compileError("Only floats or ints allowed."),
            };

            const diffy: f64 = switch (@typeInfo(T)) {
                .Int => @floatFromInt(other.y - self.y),
                .Float => other.y - self.y,
                else => @compileError("Only floats or ints allowed."),
            };

            return @sqrt(diffx * diffx + diffy * diffy);
        }
    };
}
