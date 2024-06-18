protocol QuoteGenerator {
    func randomizeQuote() -> Quote
}

struct RandomQuoteGenerator: QuoteGenerator {
    let quotes: [Quote] = [
        Quote(owner: "Albert Einstein", message: "Life is like riding a bicycle. To keep your balance, you must keep moving."),
        Quote(owner: "Mahatma Gandhi", message: "Be the change that you wish to see in the world."),
        Quote(owner: "Oscar Wilde", message: "Be yourself; everyone else is already taken."),
        Quote(owner: "Marilyn Monroe", message: "Imperfection is beauty, madness is genius and it's better to be absolutely ridiculous than absolutely boring."),
        Quote(owner: "Nelson Mandela", message: "The greatest glory in living lies not in never falling, but in rising every time we fall."),
        Quote(owner: "Walt Disney", message: "The way to get started is to quit talking and begin doing."),
        Quote(owner: "Eleanor Roosevelt", message: "The future belongs to those who believe in the beauty of their dreams."),
        Quote(owner: "Steve Jobs", message: "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do."),
        Quote(owner: "Mother Teresa", message: "Spread love everywhere you go. Let no one ever come to you without leaving happier."),
        Quote(owner: "Confucius", message: "It does not matter how slowly you go as long as you do not stop.")
    ]
    
    func randomizeQuote() -> Quote {
        quotes.randomElement() ?? quotes[0]
    }
}
