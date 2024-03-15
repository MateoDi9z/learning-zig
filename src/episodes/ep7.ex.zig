const std = @import("std");

pub fn log(comptime fmt: []const u8, args: anytype) void {
    std.debug.print(fmt, args);
}

pub fn printArray(array: []u8) !void {
    log("array: [", .{});
    for (array) |el| {
        log(" {},", .{el});
    }
    log(" ]\n\n", .{});
}

pub fn main() !void {
    const a: u8 = 0;
    const a_ptr = &a;

    // ! Error, pointed value is constant
    // * a_ptr.* += 1;
    log("a_ptr: {} a_ptr type: {}\n", .{ a_ptr.*, @TypeOf(a_ptr) });

    var b: u8 = 0;
    const b_ptr = &b;

    //? Works because b is var not const
    b_ptr.* += 1;
    log("b_ptr: {} b_ptr type: {}\n", .{ b_ptr.*, @TypeOf(b_ptr) });

    // ! Error, pointers are constant, can't be reassigned
    // a_ptr = &b;
    // b_ptr = &a;

    //? Use var pointer to change where to point
    var c_ptr = a_ptr;
    c_ptr = b_ptr; //* OK!
    log("c_ptr: {} c_ptr type: {}\n", .{ c_ptr.*, @TypeOf(c_ptr) });

    log("\n", .{});

    //? Multi-item pointer
    var array = [_]u8{ 1, 2, 3, 4, 5, 6 };

    try printArray(&array);

    var d_ptr: [*]u8 = &array;

    log("d_ptr[0]: {} d_ptr type: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });
    d_ptr[1] += 1; // index op
    d_ptr += 1; // * Pointer arithmetic - new [0] is now [1]
    log("d_ptr[0]: {} d_ptr type: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });
    d_ptr -= 1; // * Pointer arithmetic - new [0] is now [-1]
    log("d_ptr[0]: {} d_ptr type: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });
    log("\n", .{});

    //? Pointer to array
    const e_ptr = &array;
    e_ptr[1] += 1;

    log("e_ptr[0]: {} e_ptr type: {}\n", .{ e_ptr[0], @TypeOf(e_ptr) });
    log("e_ptr[1]: {} e_ptr type: {}\n", .{ e_ptr[1], @TypeOf(e_ptr) });
    log("array[1]: {}\n", .{array[0]});
    log("e_ptr.len: {}\n", .{e_ptr.len});
    log("\n", .{});

    //? Sentinel terminated pointer
    array[3] = 0;
    try printArray(&array);

    const f_ptr: [*:0]const u8 = array[0..3 :0];
    log("f_ptr[0]: {} f_ptr type: {}\n", .{ f_ptr[1], @TypeOf(f_ptr) });
    log("\n", .{});

    //? Address as integer
    const address = @intFromPtr(f_ptr);
    log("address: {} address type: {}\n", .{ address, @TypeOf(address) });

    //? Integer to address
    const g_ptr: [*:0]const u8 = @ptrFromInt(address);
    log("g_ptr[1]: {} g_ptr type: {}\n", .{ g_ptr[1], @TypeOf(g_ptr) });
    log("\n", .{});

    //? Optional pointer = pointer that can be null
    var h_ptr: ?*const usize = null;
    log("h_ptr: {?} h_ptr type: {}\n", .{ h_ptr, @TypeOf(h_ptr) });

    h_ptr = &address;
    log("h_ptr.?.*: {} h_ptr type: {}\n", .{ h_ptr.?.*, @TypeOf(h_ptr) });
    log("h_ptr size: {} h_ptr usize: {}\n", .{ @sizeOf(@TypeOf(h_ptr)), @sizeOf(*usize) });
}
