// move_semantics4.cairo
// Refactor this code so that instead of passing `arr0` into the `fill_arr` function,
// the Array gets created in the function itself and passed back to the main
// function.
// Execute `starklings hint move_semantics4` or use the `hint` watch subcommand for a hint.

// I AM NOT DONE

use array::ArrayTrait;
use debug::PrintTrait;

fn main() {
    let mut arr1 = fill_arr();

    println!("arr1 length: {}", arr1.len());
    println!("arr1 first element: {}", *arr1.at(0));

    arr1.append(88);

    println!("arr1 length: {}", arr1.len());
    println!("arr1 last element: {}", *arr1.at(arr1.len() - 1));
}

fn fill_arr() -> Array<felt252> {
    let mut arr = ArrayTrait::new();
    arr.append(22);
    arr.append(44);
    arr.append(66);

    arr
}
