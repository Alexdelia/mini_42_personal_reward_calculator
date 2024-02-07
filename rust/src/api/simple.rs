use api42::Token;
use reqwest::blocking::Client;

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    let client = Client::new();

    let mut token = Token::try_new(&client).unwrap();

    let user = token.req_user(&client, &name).unwrap();

    user.usual_full_name
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
