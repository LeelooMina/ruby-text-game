module TextResponse
    @@NUMBER_INPUT_TEXT = "You couldn't even type out the whole word?"
@@WORD_INPUT_TEXT = "Why didn't you just type the number?"
@@MISTAKE_TEXT = "Really?"
@@MISTAKE_TEXT_2 = "Let's try this again.."


@@WARRIOR_TEXT = "A warrior? Guess you expect a sword now too, huh?"
@@MAGE_TEXT= "A mage? Like Harry Potter? Hope your brought your own wand."
@@PROGRAMMER_TEXT = "You wanna be a programmer? That's.... weird."
@@PROGRAMMER_TEXT_2 = "What are you even going to fight with?"


    def number_input
        @@NUMBER_INPUT_TEXT
    end

    def word_input 
        @@WORD_INPUT_TEXT
    end

    def mistake_1 
         @@MISTAKE_TEXT

    end

    def mistake_2
        @@MISTAKE_TEXT_2
    end
        

    def warrior_selection
        @@WARRIOR_TEXT
    end

    def mage_selection
        @@MAGE_TEXT
    end

    def programmer_selection
        @@PROGRAMMER_TEXT
    end

    def programmer_selection_2
        @@PROGRAMMER_TEXT_2
    end
end
