// Challenge: Write code that will evaluate if all the elements in the list are palindromes using Swift
// e.g. racecar reveresed is still racecar
//
// Palindrome: a word or phrase that can be read the same way forwards and backwards
// Relevant Reading: https://en.wikipedia.org/wiki/Palindrome
//

import Foundation

let list = ["racecar",
            "codilitytilidoc",
            "neveroddoreven",
            "Don't nod.",
            "I did, did I?",
            "My gym",
            "Red rum, sir, is murder",
            "Step on no pets",
            "Top spot",
            "Was it a cat I saw?",
            "Eva, can I see bees in a cave?",
            "No lemon, no melon" ]


/// Solution 1
func isPalindrome(_ sentence: String) -> Bool {
    var set = Set<Character>()
    sentence.forEach { ch in
        if set.contains(ch) {
            set.remove(ch)
        } else {
            set.insert(ch)
        }
    }
    return set.count <= 1
}

/// Solution 2
func isPalindrome2(_ sentence: String) -> Bool {
    var set = Set<Character>()
    sentence.forEach { ch in set.insert(ch) }
    let halfOfSentenceCount = Float(sentence.count)/2
    return set.count <= lroundf(halfOfSentenceCount)
}

/// Solution 3
func isPalindrome3(_ sentence: String) -> Bool {
    var set = Set<Character>()
    return sentence.filter{ set.insert($0).inserted }.count <= lroundf(Float(sentence.count)/2)
}


// Is entire list Palindrome?
print(list.reduce(true) { $0 && isPalindrome($1) })

print("\n---- Solution 1 -----\n")
list.forEach { string in
    print("Is \"\(string)\" Palindrome ? - \(isPalindrome(string))")
}

print("\n---- Solution 2 -----\n")
list.forEach { string in
    print("Is \"\(string)\" Palindrome ? - \(isPalindrome2(string))")
}

print("\n---- Solution 3 -----\n")
list.forEach { string in
    print("Is \"\(string)\" Palindrome ? - \(isPalindrome3(string))")
}

