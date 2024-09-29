// functions2.cairo
// Make me compile!

use debug::PrintTrait;

fn main() {
    call_me(3);
}

fn call_me(num: felt252) {
    let mut i: felt252 = 0;
    loop {
        if i >= num {
            break;
        }
        (i + 1).print();
        println!(" Ring! Call number");
        i += 1;
    }
}
