// move_semantics6.cairo
// Execute `starklings hint move_semantics6` or use the `hint` watch subcommand for a hint.
// You can't change anything except adding or removing references.

// I AM NOT DONE

use debug::PrintTrait;

#[derive(Copy, Drop)]
struct Number {
    value: u32,
}

fn main() {
    let mut number = Number { value: 1 };

    println!("Number value: {}", get_value(@number));
    set_value(ref number, 3);
    println!("Number value: {}", get_value(@number));
}

fn get_value(number: @Number) -> u32 {
    *number.value
}

fn set_value(ref number: Number, value: u32) {
    number.value = value;
}
