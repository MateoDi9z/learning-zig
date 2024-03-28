x: f32,
y: f32 = 0,

const Point = @This();

fn new(x: f32, y: f32) Point {
    return .{ .x = x, .y = y };
}

fn distance(self: Point, other: Point) f32 {
    const diffx = other.x - self.x;
    const diffy = other.y - self.y;
    return @sqrt(diffx * diffx + diffy * diffy);
}
