local pluginName = select(1, ...)
local componentsName = select(2, ...)
local signalTable = select(3, ...)
local myHandle = select(4, ...)

function Main()

    -- definisce lo stato attuale della checkbox
    local CheckBoxState = 'Unclicked'

    -- definisce lo spazio utilizzato dal popup
    local baseInput = GetFocusDisplay().ScreenOverlay:Append('BaseInput')
    baseInput.Name = 'CDY Checkbox'
    baseInput.H = 0
    baseInput.W = 600
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
    titleBarIcon.Text = 'Titolo della messagebox'
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

    -- definisce il sottotitolo
    local subTitle = dlgFrame:Append('UIObject')
    subTitle.Text = 'Sottotitolo della messagebox'
    subTitle.ContentDriven = 'Yes'
    subTitle.ContentWidth = 'No'
    subTitle.Anchors = '0,0'
    subTitle.Padding = '20, 15'
    subTitle.Font = 'Medium20'
    subTitle.HasHover = 'No'
    subTitle.BackColor = Root{}.ColorTheme.ColorGroups.Global.Transparent75

    -- definisce la dimensione della griglia per le checkbox
    local checkBoxGrid = dlgFrame:Append('UILayoutGrid')
    checkBoxGrid.Columns = 1
    checkBoxGrid.Rows = 1
    checkBoxGrid.Anchors = '0,1'
    checkBoxGrid.Margin = '0,5'
    checkBoxGrid.BackColor = Root{}.ColorTheme.ColorGroups.Global.Transparent75

    -- aggiunge e definisce il contenuto della prima checkbox
    local checkBox1 = checkBoxGrid:Append('CheckBox')
    checkBox1.Text = 'Checkbox 1'
    checkBox1.Anchors = '0,0'
    checkBox1.TextalignmentH = 'Left'
    checkBox1.State = 0
    checkBox1.PluginComponent = myHandle
    checkBox1.Clicked = 'CheckBoxClicked'
    checkBox1.BackColor = Root{}.ColorTheme.ColorGroups.Global.Transparent75

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
    end

        if (checkBox1.State == 0) then
        checkBox1.State = 'Unclicked'
    else
        checkBox1.State = 'Clicked'
    end

    signalTable.ButtonClicked = function (Caller)
        GetFocusDisplay().ScreenOverlay:ClearUIChildren()
        Printf(CheckBoxState)
    end


end
return Main