import Cocoa
    
enum Suit: Int {
    case clubs = 1, spades, diamonds, hearts
}
//gives numeric values to the words
enum Value: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
}

struct Card {
    let suit: Suit
    let value: Value
}

// Empty deck of cards
var deck: [Card] = []

// Populating the deck
for i in 1...4 {
    for j in 2...14 {
        deck.append(Card(suit: Suit(rawValue: i)!, value: Value(rawValue: j)!))
        i
        j
    }
}

//creating player and computer and bounty instances
var player: [Card] = []
var computer: [Card] = []
var bounty : [Card] = []

// Add 3 cards from each player to the bounty
func addToBounty() {
    bounty.append(player[1])
    bounty.append(player[2])
    bounty.append(player[3])
    player.remove(at: 0)
    player.remove(at: 0)
    player.remove(at: 0)
    bounty.append(computer[1])
    bounty.append(computer[2])
    bounty.append(computer[3])
    computer.remove(at: 0)
    computer.remove(at: 0)
    computer.remove(at: 0)
}

// Deal cards to the player and computer hands
func dealCards() {
    
    while deck.count > 0 {
        
        // Get a random value between 0 and the end of the deck array
        var randomCardPosition = Int.random(in: 0...deck.count - 1)
        
        // Add to the player's hand
        player.append(deck[randomCardPosition])
        
        // Remove the card from the deck
        deck.remove(at: randomCardPosition)
        
        //picking the card position for the computer
        randomCardPosition = Int.random(in: 0...deck.count - 1)
        
        //adds to the computers hand
        computer.append(deck[randomCardPosition])
        
        // Remove the card from the deck
        deck.remove(at: randomCardPosition)
        
        print(randomCardPosition)
    }
    
}

// Actually deal the cards
dealCards()

func war() {
    
    //Add the cards to the bounty
    addToBounty()
    
    // If the player wins this round
    if player[0].value.rawValue > computer[0].value.rawValue{
        player.append(contentsOf: bounty)
        bounty.removeAll()
        
    // If the computer wins this round
    } else if computer[0].value.rawValue > player[0].value.rawValue {
        computer.append(contentsOf: bounty)
        bounty.removeAll()
        
        
    //if the computers and players value is equal: WAR
    } else {
        war()
    }
    
    
    
}


// As long as each player still has cards, keep looping
while player.count > 0 && computer.count > 0 {
    
    // If the player wins this round
    if player[0].value.rawValue > computer[0].value.rawValue{
        player.append(computer[0])
        computer.remove(at: 0)
        
    // If the computer wins this round
    } else if computer[0].value.rawValue > player[0].value.rawValue {
        computer.append(player[0])
        player.remove(at: 0)
        
    //if the computers and players value is equal: WAR
    } else {
        // if there are more than 4 cards in the computers and the players hand execute the war
        if player.count > 4 && computer.count > 4{
            war()
            
        //if there are less than 4 cards, do not execute the war
        } else {
            //if the player has more cards, he/she wins
            if player.count > computer.count {
                print("Player FOR THE WIIIN")
                player.removeAll()
                //if the computer has more cards, it wins
            } else {
                print("Computerrsss always win")
                computer.removeAll()
            }
            
        }
        
        
    }
    
}




if player.count == 0 {
    print("The player lost")
} else if computer.count == 0{
    print("The computer lost")
}


