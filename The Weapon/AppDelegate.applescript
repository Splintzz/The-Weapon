--
--  AppDelegate.applescript
--  The Weapon
--
--  Created by Spencer Carr on 2/7/19.
--  Copyright © 2019 Spencer Carr. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property theWindow : missing value
    property countdownBar : missing value
    property unauthorizedTag : missing value
    
    --Set Editor box
    property messagesEnteredNumerator : missing value
    property messagesEnteredDenominator : missing value
    property enteredMessage : missing value
    property messageOne : missing value
    property messageTwo : missing value
    property messageThree : missing value
    property messageFour : missing value
    property messageFive : missing value
    
    property numberOneLabel : missing value
    property numberTwoLabel : missing value
    property numberThreeLabel : missing value
    property numberFourLabel : missing value
    property numberFiveLabel : missing value
    
    --Spam Configurations box
    property lengthLabel : missing value
    property quantityLabel : missing value
    property intervalLabel : missing value
    
    --Security Clearance box
    property passwordSlot : missing value
    property accessGrantedLabel : missing value
    
    property passcode : "Who's up?"
    property buttonIsEnabled : false
    property lengthOfSet : 3
    property quantityOfSet : 25
    property intervalOfSpam : 0.05
    property setIsNotFull : true
    property numberOfEnteredMessages : 0
    property unauthorized : "You have not been authorized to use the weapon."
    property notLoaded : "Weapon has not been loaded."
    property canLoad : false
    property isLoaded : false
    property stealthModeOn : false
    property configuredLength : 3
    
    property spamSet : {}
    property messageLabels : missing value
    property numberLabels : missing value
    
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
    
    on buttonPush_(sender)
        if buttonIsEnabled equals true then
            set the stringValue of unauthorizedTag to ""
            if isLoaded equals true then
                set the stringValue of unauthorizedTag to ""
                tell application "Messages"
                    activate
                end tell
                
                tell application "System Events"
                    set repeatAttackMessage to "Master control has authorized another attack."
                    set endAttackMessage to "Master control has ceased attack."
                    set countdown to 1
                    set instruction to "yes"
                    set reloadMessages to {"Preparing to launch again.", "Reloading weapon.", "......", "Weapon has been successfully reloaded. Awaiting response from master control."}
                    set warningMessages to {"The weapon is preparing to launch.", "......", "Preparing weapon. Please standby.", "......", "WARNING!!!  THE WEAPON IS LAUNCHING. ALL MEMBERS SHOULD CONSIDER THIS SITUATION DEFCON 1 AND EXIT THE CHAT IMMEDIATELY!!!", "Weapon has been launched. Take cover and brace for impact."}
                    repeat while instruction equals "yes"
                        --log the total number of messages that will be sent, excluding warnings messages, initial messages, etc.
                        
                        display dialog "Click the command line to spam, and the program will execute in 10 seconds"
                        --Display that there are ten seconds left to locate the command line, before the attack is launched
                        
                        repeat 10 times
                            set integerValue of countdownBar to countdown
                            set countdown to (countdown + 1)
                            delay 1
                        end repeat
                        --log the ten second grace period
                        
                        if stealthModeOn is false then       
                            repeat with a from 1 to length of the warningMessages
                                keystroke item a of warningMessages
                                keystroke return
                                delay 5
                            end repeat
                        end if
                        --display warning messages
                        
                        repeat quantityOfSet times
                            --delay intervalOfSpam
                            repeat with a from 1 to length of the spamSet
                                keystroke item a of spamSet
                                keystroke return
                            end repeat
                        end repeat
                        --launches spam attack
                        
                        repeat with a from 1 to length of the reloadMessages
                            delay 5
                            keystroke item a of reloadMessages
                            keystroke return
                        end repeat
                        
                        set the integerValue of countdownBar to 0
                        --Display the messages explaining that the program is reloading
                        set instruction to the text returned of (display dialog "Launch again?" default answer "yes/no")
                        --Ask if the attack should launch again
                        delay 5
                        
                        if instruction equals "yes" then
                            keystroke repeatAttackMessage
                            keystroke return
                        end if
                        --if the attack is launching again, display a message that says the attack is launching again
                    end repeat
                    
                    keystroke endAttackMessage
                    keystroke return
                    --the attack is complete, display message that says the attack is over
                end tell
            else
                set the stringValue of unauthorizedTag to notLoaded
            end if
        else
            set the stringValue of unauthorizedTag to unauthorized
        end if
    end buttonPush_
    
    on setLengthSlider_(sender)
        set stringValue of lengthLabel to the value of sender
        set lengthOfSet to the value of sender
    end setLengthSlider_
    
    on setQuantitySlider_(sender)
        set stringValue of quantityLabel to the value of sender
        set quantityOfSet to the value of sender
    end setQuantitySlider_
    
    on setIntervalSlider_(sender)
        set stringValue of intervalLabel to the value of sender
        set intervalOfSpam to the value of sender
    end setIntervalSlider_
    
    on configure_(sender)
        set messageLabels to {messageOne, messageTwo, messageThree, messageFour, messageFive}
        set stringValue of messagesEnteredDenominator to (lengthOfSet as string)
        set spamSet to {}
        set numberLabels to {numberOneLabel, numberTwoLabel, numberThreeLabel, numberFourLabel, numberFiveLabel}
        set numberOfEnteredMessages to 0
        set the stringValue of messagesEnteredNumerator to "0"
        
        set loopLimit to lengthOfSet
        set the stringValue of messagesEnteredNumerator to "0"
        
        repeat with a from loopLimit to 5
            set stringValue of item a in numberLabels to ("" as string)
        end repeat
        
        repeat with a from 1 to loopLimit
            set stringValue of item a in numberLabels to ( (a as string) & ".")
        end repeat
        
        repeat with a from 1 to the length of messageLabels
            set the stringValue of item a in messageLabels to ""
        end repeat
        
        set configuredLength to lengthOfSet
    end configure_
    
    on saveMessageToSet_(sender)
        if (numberOfEnteredMessages as string) doesn't equal (configuredLength as string) then
            set messageLabels to {messageOne, messageTwo, messageThree, messageFour, messageFive}
            set end of spamSet to the (stringValue of enteredMessage as string)
            set numberOfEnteredMessages to (numberOfEnteredMessages + 1)
            set the stringValue of messagesEnteredNumerator to (numberOfEnteredMessages as string)
            set the stringValue of item numberOfEnteredMessages in messageLabels to stringValue of enteredMessage
        end if
    end saveMessageToSet_
    
    on passcodeEnter_(sender)
        if (canLoad equals true) and ((numberOfEnteredMessages as string) equals (lengthOfSet as string)) then
            set isLoaded to true
            set the stringValue of accessGrantedLabel to "Load Succesful"
            
            do shell script "open /Users/spencercarr/Desktop/Folders/Coding\\ Projects/Completed\\ Projects/The\\ Weapon/Exit\\ Strategy.pages"
        end if
        
        if ((stringValue of passwordSlot as string) equals passcode) and canLoad doesn't equal true then
            set buttonIsEnabled to true
            set the title of sender to "Load Attack"
            set the stringValue of passwordSlot to ""
            set canLoad to true
            set the stringValue of accessGrantedLabel to "Access Granted"
            set the stringValue of unauthorizedTag to ""
        end if
    end passcodeEnter_
    
    on reset_(sender)
        set spamSet to {}
        set the stringValue of messagesEnteredNumerator to "0"
        set numberOfEnteredMessages to 0
        
        repeat with a from 1 to the length of messageLabels
            set the stringValue of item a in messageLabels to ""
        end repeat
    end reset_
    
    on stealthMode_(sender)
        set stealthModeOn to not stealthModeOn
    end stealthMode_
end script

