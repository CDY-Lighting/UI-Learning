local pluginName = select(1, ...)
local componentsName = select(2, ...)
local signalTable = select(3, ...)
local myHandle = select(4, ...)

function CustomCheckList(Table)
   local DialogColumns = 0
   local DialogRows = 0
   local ElementPositionH = {}
   local ElementPositionV = {}
   local Element = {}
   local CheckBoxState = {}
   local continue = false

    if (Table.DialogWidth == nil) then
        DialogWidth = 700
    else
        DialogWidth = Table.DialogWidth

for i = 1,100 do
    if (Table.elements[i] ~= nil) then
        if (Table.elements[i].type == 'CheckBox') then
        if (Table.elements[i].PositionH == nil) then
                ElementPositionH[i] = 0
        elseif(Table.element[i].PositionH == nil) then
                ElementPositionH[i] = Table.elements[i].PositionH - 1
        end

        if (Table.elements[i].PositionV == nil) then
                ElementPositionV[i] = i - 1
        else
                ElementPositionV[i] = Table.elements[i].PositionV - 1
        end
        if (DialogColumns < ElementPositionH[i] + 1) then
            DialogColumns = ElementPositionH[i] + 1
        end
        if (DialogRows < ElementPositionV[i] + 1) then
            DialogRows = ElementPositionV[i] + 1
        end
    else
        break
    end
end

    -- definisce lo spazio utilizzato dal popup
    local baseInput = GetFocusDisplay().ScreenOverlay:Append('BaseInput')
    baseInput.Name = 'CDY Checkbox'
    baseInput.H = 0
    baseInput.W = DialogWidth
    baseInput.Columns = 1
    baseInput.Rows = 2
    baseInput[1][1].SizePolicy = 'Fixed'
    baseInput[1][1].size = 60
    baseInput[1][2].SizePolicy = 'Stretch'
    baseInput.AutoClose = 'No'
    baseInput.CloseOnEscape = 'Yes'
    baseInput.BackColor = Root{}.ColorTheme.ColorGroups.Global.PartlySelectedPreset

    -- definisce la titlebar
    local titleBar = baseInput:Append('TitleBar')
    titleBar.Columns = 2
    titleBar.Rows = 1
    titleBar.Anchors = '0,0'
    titleBar[2][2].SizePolicy = 'Fixed'
    titleBar[2][2].size = 50
    titleBar.Texture = 'corner2'
    titleBar.BackColor = Root{}.ColorTheme.ColorGroups.Global.PartlySelectedPreset


    -- definisce il titolo della messagebox e l'icona a sinistra del titolo
    local titleBarIcon = titleBar:Append('TitleButton')
    titleBarIcon.Text = Table.Title
    titleBarIcon.Texture = 'corner1'
    titleBarIcon.Anchors = '0,0'
    titleBarIcon.Icon = 'star'
    titleBarIcon.BackColor = Root{}.ColorTheme.ColorGroups.Global.PartlySelectedPreset
    titleBarIcon.TextColor = Root{}.ColorTheme.ColorGroups.Clock.Pixel

    -- definisce il pulsante di chiusura
    local titleBarCloseButton = titleBar:Append('CloseButton')
    titleBarCloseButton.Anchors = '1,0'
    titleBarCloseButton.Texture = 'corner2'
    titleBarCloseButton.HasHover = 'Yes'
    titleBarCloseButton.BackColor = Root{}.ColorTheme.ColorGroups.Global.PartlySelectedPreset

    -- definisce la dimensione della checkbox
    local dlgFrame = baseInput:Append('DialogFrame')
    dlgFrame.W = '100%'
    dlgFrame.H = '100%'
    dlgFrame.Columns = 1
    dlgFrame.Rows = 3
    dlgFrame.Anchors = '0,1'
    dlgFrame[1][1].SizePolicy = 'Fixed'
    dlgFrame[1][1].size = 60
    dlgFrame[1][2].SizePolicy = 'Fixed'
    dlgFrame[1][2].size = 60
    dlgFrame[1][3].SizePolicy = 'Fixed'
    dlgFrame[1][3].size = 60
    dlgFrame.BackColor = Root{}.ColorTheme.ColorGroups.Global.PartlySelectedPreset

    -- definisce la dimensione della griglia per le checkbox
    local checkBoxGrid = dlgFrame:Append('UILayoutGrid')
    checkBoxGrid.Columns = DialogColumns
    checkBoxGrid.Rows = DialogRows
    checkBoxGrid.Anchors = '0,1'
    checkBoxGrid.Margin = '0,5'
    checkBoxGrid.BackColor = Root{}.ColorTheme.ColorGroups.Global.Transparent75

    local function ActivateCheckBox(index)
     Element[index] = checkBoxGrid:Append('CheckBox')
     Element[index].Text = Table.elemets[index].name
     Element[index].Anchors = {
        top = ElementPositionV[index],
        bottom = ElementPositionV[index],
        left = ElementPositionH[index],
        right = ElementPositionH[index],
    }
      Element[index].TextalignmentH = 'Left'
      Element[index].State = CheckBoxState[index]
      Element[index].PluginComponent = myHandle
      Element[index].Clicked = 'CheckBoxClicked'
     Element[index].BackColor = Root{}.ColorTheme.ColorGroups.Global.Transparent75  
    end
    
    local function ActivateSubtitle(index)
    -- definisce il sottotitolo
      Element[index] = dlgFrame:Append('UIObject')
      Element[index].Text = Table.elements[index].name
      Element[index].ContentDriven = 'Yes'
      Element[index].ContentWidth = 'No'
      Element[index].Anchors = {
        top = ElementPositionV[index],
        bottom = ElementPositionV[index],
        left = ElementPositionH[index],
        right = ElementPositionH[index],
    }
      Element[index].Padding = '20, 15'
    Element[index].Font = 'Medium20'
    Element[index].HasHover = 'No'
    Element[index].BackColor = Root{}.ColorTheme.ColorGroups.Global.Transparent75
    end

    for i = 1,100 do
        if (Table.elements[i] ~= nil) then
            if (table.elements[i].type == 'CheckBox') then
                if (Table.elements[i].state == 1) then
                    CheckBoxState[i] = 1
                else
                    CheckBoxState[i] = 0
                end
            elseif(Table.elements[i].type == 'Subtitle') then
                ActivateSubtitle(i)
            end
        else
            break
        end
    end
    
    -- definisce la dimensione del tasto Apply
    local buttonGrid = dlgFrame:Append('UILayoutGrid')
    buttonGrid.Columns = 1
    buttonGrid.Rows = 1
    buttonGrid.Anchors = '0,2'

    -- definisce il contenuto del pulsante Apply
    local applyButton = buttonGrid:Append('Button')
    applyButton.Anchors = '0,0'
    applyButton.HasHover = 'Yes'
    applyButton.TextShadow = 1
    applyButton.TextalignmentH = 'Centre'
    applyButton.Text = 'Apply'
    applyButton.Font = 'Medium20'
    applyButton.PluginComponent = myHandle
    applyButton.Clicked = 'ButtonClicked'
    applyButton.TextColor = Root{}.ColorTheme.ColorGroups.Clock.Pixel

    -- definisce lo stato del checkbox quando flaggato
    signalTable.CheckBoxClicked = function (Caller)
        if (Caller.State == 1) then
            Caller.State = 0
        else
            Caller.State = 1
        end
        for i = 1, 100 do
           if (Element[i] ~= nil) then
                if (Element[i].type == 0) then
                   CheckBoxState[i] = 0
                elseif (Element[i].type == 1) then
                    CheckBoxState[i] = 1
                end
            end
        end
    end

    signalTable.ButtonClicked = function (Caller)
        GetFocusDisplay().ScreenOverlay:ClearUIChildren()
        continue = true
    end

    repeat
    until continue

    return CheckBoxState
end

function main()
    if (myStates == nil) then
        myStates = {}
    end
   local myStates = CustomCheckList({Title = 'CDYDMI titolo', elemets = {{
        type ='SubTitle', name = 'Sottotitolo', positionH = 1, positionV = 1},{
        type = 'CheckBox', name = 'CheckBox 1', positionH = 2, positionV = 1, state = myStates[2], {
        type = 'CheckBox', name = 'CheckBox 2', positionH = 3, positionV = 1, state = myStates[3]
        }}})
end
return main