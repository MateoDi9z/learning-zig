const std = @import("std");

pub fn main() !void {
    // A slice with comptime known bounds results in a pointer to an array
    var array = [_]u8{ 0, 1, 2, 3, 4, 5 };
    const array_ptr = array[0..array.len];
    std.debug.print("\n\narray_ptr type: {}\n", .{@TypeOf(array_ptr)});

    std.debug.print("\n", .{});

    // force runtime 0
    const zero: usize = 0;

    // slice by using slicing syntax
    const a_slice: []u8 = &array;
    a_slice[0] += 1;
    std.debug.print("a_slice[0]: {}, a_slice.len: {}\n", .{ a_slice[0], a_slice.len });

    // A slice is a multi-item pointer and a length (usize).
    std.debug.print("a_slice.ptr: {}\n", .{@TypeOf(a_slice.ptr)});
    std.debug.print("a_slice.len: {}\n", .{@TypeOf(a_slice.len)});
    std.debug.print("\n", .{});

    const b_slice = array[zero..];
    //b_slice.ptr += 2; // Pointer arithmetic on multi-item pointer
    // b_slice.len -= 2;

    std.debug.print("b_slice: {any}\n", .{b_slice});
    std.debug.print("\n", .{});

    // slicing slices
    const c_slice = array_ptr[zero..3];
    std.debug.print("c_slice ([zero..3]): {any}\n", .{c_slice});

    // slices have bound checking
    // c_slice[10] = 2; //! Error - Panic
    std.debug.print("\n", .{});

    const d_slice = array_ptr[zero..2];
    std.debug.print("d_slice: {any}\n", .{d_slice});

    // Sentinel terminated slice
    array[4] = 0;
    const e_slice: [:0]u8 = array[0..4 :0];
    std.debug.print("e_slice[e_slice.len]: {}\n", .{e_slice[e_slice.len]});
    std.debug.print("e_slice: {any}\n", .{e_slice});

    const start: usize = 2;
    const length: usize = 4;
    const f_slice = array[start..][0..length];
    std.debug.print("f_slice: {any}\n", .{f_slice});
}
