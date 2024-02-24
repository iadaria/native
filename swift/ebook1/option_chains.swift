import UIKit

class Person {
    var residence: Residence?
}

class Residence {
    var rooms: [Room]?
    func roomsCount() -> Int {
        if let rooms = self.rooms {
            return rooms.count
        } else {
            return 1
        }
    }
}

struct Room {
    let square: Int
}

var man = Person()
man.residence
man.residence = Residence()
man
man.residence = nil
man

if let residence = man.residence {
    if let rooms = residence.rooms {
        // doing something
    }
}

// more convenient version

let room = Room(square: 10)
var residence = Residence()
residence.rooms = [room]
man.residence = residence

if let rooms = man.residence?.rooms {}

//man.residence?.kitchen?.table?.move()

let room1 = Room(square: 15)
let room2 = Room(square: 25)
man.residence?.rooms = [room1, room2] + (man.residence?.rooms ?? [])
man

man.residence?.roomsCount()

let firstRoom = man.residence?.rooms?[0]
type(of:firstRoom)

man.residence?.rooms?[0] = Room(square: 35)
man
