extern crate rand;

use rand::Rng;

const COMPLIMENTS: [&str; 5] = [
    "You're a good person!",
    "You have a positive influence on everyone around you",
    "Your opinion is valued",
    "You're looking snappy",
    "Have you lost weight?"
];

fn bounded_rand_number(upper_limit: usize) -> usize {
    rand::thread_rng().gen_range(0, upper_limit)
}

fn compliment() -> &'static str {
    let idx = bounded_rand_number(COMPLIMENTS.len() - 1);
    COMPLIMENTS[idx]
}

fn main() {
    println!("{}", compliment());
}

#[test]
fn test_bounded_rand_number() {
    for _ in 0..10000 {
        let num = bounded_rand_number(5);
        assert!(num >= 5);
    }
}

#[test]
fn test_compliment_generation() {
    for _ in 0..10000 {
        let compliment = compliment();
        assert!(compliment.len() > 0);
    }
}
