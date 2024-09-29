// structs1.cairo
// Address all the TODOs to make the tests pass!
// Execute `starklings hint structs1` or use the `hint` watch subcommand for a hint.

// I AM NOT DONE
#[derive(Copy, Drop)]
struct ColorClassicStruct {
    // TODO: Something goes here
    red: u8,
    green: u8,
    blue: u8,
}

#[derive(Copy, Drop)]
struct ColorTupleStruct(u8, u8, u8);

#[cfg(test)]
mod tests {
    use super::{ColorClassicStruct, ColorTupleStruct};

    #[test]
    fn classic_c_structs() {
        // TODO: Instantiate a classic c struct!
        let green = ColorClassicStruct {
            red: 0,
            green: 255,
            blue: 0,
        };

        assert(green.red == 0, 'red should be 0');
        assert(green.green == 255, 'green should be 255');
        assert(green.blue == 0, 'blue should be 0');
    }

    #[test]
    fn tuple_structs() {
        // TODO: Instantiate a tuple struct!
        let green = ColorTupleStruct(0, 255, 0);

        assert(green.0 == 0, 'first value should be 0');
        assert(green.1 == 255, 'second value should be 255');
        assert(green.2 == 0, 'third value should be 0');
    }
}
