// move_semantics3.cairo
// Make me compile without adding new lines-- just changing existing lines!
// (no lines with multiple semicolons necessary!)
// Execute `starklings hint move_semantics3` or use the `hint` watch subcommand for a hint.

// I AM NOT DONE

use array::ArrayTrait;
use debug::PrintTrait;

fn main() {
    let arr0 = ArrayTrait::new();

    let mut arr1 = fill_arr(arr0);

    println!("arr1 length: {}", arr1.len());
    println!("arr1 first element: {}", *arr1.at(0));

    arr1.append(88);

    println!("arr1 length: {}", arr1.len());
    println!("arr1 last element: {}", *arr1.at(arr1.len() - 1));
}

fn fill_arr(mut arr: Array<felt252>) -> Array<felt252> {
    arr.append(22);
    arr.append(44);
    arr.append(66);

    arr
}
