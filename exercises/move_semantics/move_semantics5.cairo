// move_semantics5.cairo
// Make me compile only by reordering the lines in `main()`, but without
// adding, changing or removing any of them.
// Execute `starklings hint move_semantics5` or use the `hint` watch subcommand for a hint.

// I AM NOT DONE

#[test]
fn main() {
    let mut x = ArrayTrait::new();
    let y = x.clone();
    let z = pass_by_value(x);

    x.append(1);
    y.append(2);
    z.append(3);

    println!("x length: {}", x.len());
    println!("y length: {}", y.len());
    println!("z length: {}", z.len());
}

fn pass_by_value(mut arr: Array<felt252>) -> Array<felt252> {
    arr
}

fn pass_by_ref(ref arr: Array<felt252>) {}

fn pass_by_snapshot(x: @Array<felt252>) {}
