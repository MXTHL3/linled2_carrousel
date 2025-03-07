Function start_Initialize(msgPort As Object, userVariables As Object, bsp As Object)
    print "start_Initialize - entry"

    start_ = newStart(msgPort, userVariables, bsp)

    return start_ 
End Function

Function newStart(msgPort As Object, userVariables As Object, bsp As Object)
    s = {}
    s.msgPort = msgPort
    s.userVariables = userVariables
    s.bsp = bsp
    s.ProcessEvent = start_ProcessEvent
    s.objectName = "start_object"
    return s
End Function

Function start_ProcessEvent(event As Object)
    m.bsp.printdebug("Le plugin start.brs a été activé.")
    if type(event) = "roAssociativeArray" then
        if type(event["EventType"]) = "roString"
            if (event["EventType"] = "SEND_PLUGIN_MESSAGE") then
                if lcase(event["PluginName"]) = "start" then
                    m.startImagesSequence()
                endif
            endif  
        endif      
    endif
End Function

Function fadeOut(element As Object, duration As Integer)
    opacityStep = 0.05 
    currentOpacity = 1.0
    interval = duration / (1 / opacityStep)

    while currentOpacity > 0
        currentOpacity = currentOpacity - opacityStep
        if currentOpacity < 0
            currentOpacity = 0
        end if
        element.opacity = currentOpacity
        Sleep(interval)
    endwhile
End Function

Function startImagesSequence()
    linledLogo = m.top.findChild("LinLED logo")
    if linledLogo <> invalid then
        linledLogo.visible = true
    end if
    iSMLogo = m.top.findChild("ISM logo")
    defaultBackground = m.top.findChild("Default background")
    openImage = m.top.findChild("Open")

    linledLogo.visible = true
    iSMLogo.visible = true
    defaultBackground.visible = true
    openImage.visible = true  

    screenWidth = m.top.width
    screenHeight = m.top.height

    defaultBackground.width = screenWidth  
    defaultBackground.height = screenHeight  
    defaultBackground.x = 0  
    defaultBackground.y = 0 

    linledLogo.width = screenWidth * 0.25  
    linledLogo.height = screenHeight * 0.30  
    linledLogo.x = screenWidth * 0.25  
    linledLogo.y = screenHeight * 0.20  

    iSMLogo.width = screenWidth * 0.50  
    iSMLogo.height = screenHeight * 0.30  
    iSMLogo.x = screenWidth * 0.25  
    iSMLogo.y = screenHeight * 0.60 
    
    openImage.width = screenWidth * 0.30  
    openImage.height = screenHeight * 0.20  
    openImage.x = (screenWidth - openImage.width) / 2
    openImage.y = (screenHeight - openImage.height) / 2 

    sleep(2000)
    fadeOut(linledLogo, 500) 
    fadeOut(iSMLogo, 500) 

    sleep(0)
    linledLogo.visible = false
    iSMLogo.visible = false

    sleep(3000)
    defaultBackground.visible = true
    openImage.visible = true 
End Function