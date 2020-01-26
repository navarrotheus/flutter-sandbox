class Player {
  List<Card> playerCards = [];

  Player(List<Card> deal) {
    for(var card in deal) {
      playerCards.add(card);
    }
  }

  toString() {
    return playerCards.toString();
  }
}

class Table {
  List<Card> tableCards = [];
  
  Table(List<Card> deal) {
    for(var card in deal) {
      tableCards.add(card);
    }
  }

  toString() {
    return tableCards.toString();
  }

  showFlop() {
    return tableCards.sublist(0, 2);
  }

  showTurn() {
    return tableCards.sublist(2, 3);
  }

  showRiver() {
    return tableCards.sublist(3, 4);
  }
}

class Deck {
  List<Card> deckCards = [];
  
  Deck() {
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight',
                 'Nine', 'Ten', 'Jack', 'Queen', 'King'];
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];
    
    for (var suit in suits) {
      for (var rank in ranks) {
        var card = new Card(rank, suit);
        deckCards.add(card);
      }
    }
  }
  
  toString() {
    return deckCards.toString();
  }
  
  shuffle() {
    deckCards.shuffle();
  }
  
  cardsWithSuit(String suit) {
    return deckCards.where((card) => card.suit == suit);
  }
  
  deal(int handSize) {
    var hand = deckCards.sublist(0, handSize);
    deckCards = deckCards.sublist(handSize);
    
    return hand;
  }
  
  removeCard(String suit, String rank) {
    deckCards.removeWhere((card) => (card.suit == suit) && (card.rank == rank));
  }
}

class Card {
  String suit;
  String rank;
  
  Card(this.rank, this.suit);
  
  toString() {
    return '$rank of $suit';
  }
}
