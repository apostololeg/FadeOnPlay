set current_application to (path to frontmost application as Unicode text)

tell application "System Events"
    if process "iTunes" exists then
        tell application "iTunes"
            if sound volume = 0 then
                set current_volume to the 60
            else
                set current_volume to the sound volume
            end if
            set current_state to the stopped
            repeat
                if player state is paused and current_state is not paused then
                    set the current_state to paused
                    repeat
                        repeat with i from current_volume to 0 by -5
                            set the sound volume to i
                            delay 0.01
                        end repeat
                        pause
                        exit repeat
                    end repeat
                end if
                if player state is playing and current_state is not playing and current_state is not stopped then
                    set the current_state to playing
                    set the sound volume to 0
                    play
                    repeat with j from 0 to current_volume by 2
                        set the sound volume to j
                        delay 0.01
                    end repeat
                end if
                delay 0.5
            end repeat
        end tell
        tell application current_application
            activate
        end tell
    end if
end tell
