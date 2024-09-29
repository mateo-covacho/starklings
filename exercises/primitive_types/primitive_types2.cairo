// primitive_types2.cairo
// Fill in the rest of the line that has code missing!
// No hints, there's no tricks, just get used to typing these :)

fn main() {
    // Characters (`char`)

    let my_first_initial = 'C';
    if my_first_initial.into() == 67 {
        println!("Congratulations!");
    } else {
        println!("Oops!");
    }

    let your_character = '🦀'; // Hint: Try a letter, number or special character
    if your_character.into() == 129408 {
        println!("Congratulations!");
    } else {
        println!("Oops!");
    }
}

fn is_alphabetic(ref char: felt252) -> bool {
    if char >= 'a' {
        if char <= 'z' {
            return true;
        }
    }
    if char >= 'A' {
        if char <= 'Z' {
            return true;
        }
    }
    false
}

fn is_numeric(ref char: felt252) -> bool {
    if char >= '0' {
        if char <= '9' {
            return true;
        }
    }
    false
}

// Note: the following code is not part of the challenge, it's just here to make the code above work.
// Direct felt252 comparisons have been removed from the core library, so we need to implement them ourselves.
// There will probably be a string / short string type in the future
impl PartialOrdFelt of PartialOrd<felt252> {
    #[inline(always)]
    fn le(lhs: felt252, rhs: felt252) -> bool {
        !(rhs < lhs)
    }
    #[inline(always)]
    fn ge(lhs: felt252, rhs: felt252) -> bool {
        !(lhs < rhs)
    }
    #[inline(always)]
    fn lt(lhs: felt252, rhs: felt252) -> bool {
        integer::u256_from_felt252(lhs) < integer::u256_from_felt252(rhs)
    }
    #[inline(always)]
    fn gt(lhs: felt252, rhs: felt252) -> bool {
        rhs < lhs
    }
}
