Function openButton_ProcessEvent(event As Object)
    m.bsp.printdebug("Le plugin openButton.brs a été activé.")
    if type(event) = "roAssociativeArray" then
        if type(event["EventType"]) = "roString"
            if (event["EventType"] = "SEND_PLUGIN_MESSAGE") then
                if event["PluginName"] = "openButton" then
                    m.openButtonReacts()
                endif
            endif  
        endif      
    endif
End Function

Sub openButtonReacts()
    
End Sub