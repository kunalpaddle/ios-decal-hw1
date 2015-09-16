//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String!
    var wordB : String!
    
    init (words: [String?]) {
        wordA = words[0]
        wordB = words[1]
    }
    
//: [EXPLAIN YOUR ANSWER TO Q1 HERE]
    /*
    Having "String?" already safely unwraps the optional Strings stored in words.
    Adding the extra question marks to wordA and wordB is redundant.
    */
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    static func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reverse())}
        var numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: [EXPLAIN YOUR ANSWER TO Q2 HERE]
    
    /*
    1.Booleans should not be optional. The method should return true or false, NOT true,false,or nil.
    2. 'i' must be mutable so that it can be incremented in the loop. However, it is declared with a let statement, which makes it immutable. Change to var.
    
    */
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    static func isAnagram(wordA: String, wordB: String) -> Bool {
        var countLetters = [Character : Int]()
        var lenA = wordA.characters.count
        var lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: [EXPLAIN YOUR ANSWER TO Q3 HERE]
/*
1.Booleans should not be optional. The method should return true or false, NOT true,false,or nil.
2.Empty dictionary should be assigned with an = and ().
3.The anagram and palindrome functions are not tied to an instance of Foo. Hence, they should be labelled static.
*/

//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

