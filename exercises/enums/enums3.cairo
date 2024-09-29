// enums3.cairo
// Address all the TODOs to make the tests pass!

use debug::PrintTrait;

#[derive(Drop)]
enum Message {
    ChangeColor: (u8, u8, u8),
    Echo: felt252,
    Move: Point,
    Quit,
}

#[derive(Drop)]
struct Point {
    x: u8,
    y: u8,
}

#[derive(Drop)]
struct State {
    color: (u8, u8, u8),
    position: Point,
    quit: bool,
}

trait StateTrait {
    fn change_color(ref self: State, new_color: (u8, u8, u8));
    fn echo(ref self: State, s: felt252);
    fn move_position(ref self: State, p: Point);
    fn quit(ref self: State);
    fn process(ref self: State, message: Message);
}

impl StateImpl of StateTrait {
    fn change_color(ref self: State, new_color: (u8, u8, u8)) {
        self.color = new_color;
    }

    fn echo(ref self: State, s: felt252) {
        s.print();
    }

    fn move_position(ref self: State, p: Point) {
        self.position = p;
    }

    fn quit(ref self: State) {
        self.quit = true;
    }

    fn process(ref self: State, message: Message) {
        match message {
            Message::ChangeColor(color) => self.change_color(color),
            Message::Echo(msg) => self.echo(msg),
            Message::Move(point) => self.move_position(point),
            Message::Quit => self.quit(),
        }
    }
}

#[test]
fn test_match_message_call() {
    let mut state = State {
        color: (0, 0, 0),
        position: Point { x: 0, y: 0 },
        quit: false,
    };
    state.process(Message::ChangeColor((255, 0, 255)));
    state.process(Message::Echo('hello world'));
    state.process(Message::Move(Point { x: 10, y: 15 }));
    state.process(Message::Quit);

    assert(state.color == (255, 0, 255), 'wrong color');
    assert(state.position.x == 10, 'wrong x position');
    assert(state.position.y == 15, 'wrong y position');
    assert(state.quit == true, 'quit should be true');
}
