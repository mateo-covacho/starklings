// move_semantics2.cairo
// Make me compile without changing line 16 or moving line 13!
// Execute `starklings hint move_semantics2` or use the `hint` watch subcommand for a hint.

use array::ArrayTrait;
use debug::PrintTrait;

// I AM NOT DONE

fn main() {
    let arr0 = ArrayTrait::new();

    let mut arr1 = fill_arr(arr0);

    // Do not change the following line!
    println!("arr0 length: {}", arr0.len());

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
