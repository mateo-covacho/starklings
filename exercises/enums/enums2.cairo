// enums2.cairo
// Execute `starklings hint enums2` or use the `hint` watch subcommand for a hint.



use debug::PrintTrait;

#[derive(Drop)]
enum Message {
    Move: (u32, u32),
    Echo: felt252,
    ChangeColor: (u8, u8, u8),
    Quit,
}

fn main() {
    let mut messages = array![];
    messages.append(Message::Move((10, 30)));
    messages.append(Message::Echo('hello world'));
    messages.append(Message::ChangeColor((0, 255, 255)));
    messages.append(Message::Quit);

    print_messages(messages);
}

fn print_messages(messages: Array<Message>) {
    let mut idx = 0;
    loop {
        if idx >= messages.len() {
            break;
        }
        match *messages.at(idx) {
            Message::Move((x, y)) => {
                'Move'.print();
                x.print();
                y.print();
            },
            Message::Echo(s) => {
                'Echo'.print();
                s.print();
            },
            Message::ChangeColor((r, g, b)) => {
                'ChangeColor'.print();
                r.print();
                g.print();
                b.print();
            },
            Message::Quit => {
                'Quit'.print();
            },
        }
        idx += 1;
    }
}

// Utility function to print messages. Don't modify these.

trait MessageTrait<T> {
    fn call(self: T);
}

impl MessageImpl of MessageTrait<Message> {
    fn call(self: Message) {
        self.print()
    }
}

fn print_messages_recursive(messages: Array<Message>, index: u32) {
    match gas::withdraw_gas() {
        Option::Some(_) => {},
        Option::None => {
            let mut data = ArrayTrait::<felt252>::new();
            data.append('OOG');
            panic(data);
        },
    }
    if index >= messages.len() {
        return ();
    }
    let message = *messages.at(index);
    message.call();
    print_messages_recursive(messages, index + 1)
}

impl MessagePrintImpl of PrintTrait<Message> {
    fn print(self: Message) {
        println!("___MESSAGE BEGINS___");
        match self {
            Message::Quit => println!("Quit"),
            Message::Echo(msg) => println!("{}", msg),
            Message::Move((a, b)) => {
                println!("{}", a);
                println!("{}",b);
            },
            Message::ChangeColor((red, green, blue)) => {
                println!("{}",red);
                println!("{}",green);
                println!("{}",blue);
            }
        }
        println!("___MESSAGE ENDS___");
    }
}
