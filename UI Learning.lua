local pluginName = select(1, ...)
local componentsName = select(2, ...)
local signalTable = select(3, ...)
local myHandler = select(4, ...)

function Main()

    -- definisce lo spazio utilizzato dal popup
    local baseInput = GetFocusDisplay().ScreenOverlay:Append('BaseInput')
    baseInput.Name = 'CDY'
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

    -- definisce la dimensione e la texture del titolo
    local titleBar = baseInput:Append('TitleBar')
    titleBar.Columns = 2
    titleBar.Rows = 1
    titleBar.Anchors = '0,0'
    titleBar[2][2].SizePolicy = 'Fixed'
    titleBar[2][2].size = 50
    titleBar.Texture = 'corner2'

    -- definisce il titolo della messagebox e l'icona a sinistra del titolo
    local titleBarIcon = titleBar:Append('TitleButton')
    titleBarIcon.Text = 'Titolo della messagebox'
    titleBarIcon.Texture = 'corner1'
    titleBarIcon.Anchors = '0,0'
    titleBarIcon.Icon = 'star'

    -- definisce il pulsante di chiusura
    local titleBarCloseButton = titleBar:Append('CloseButton')
    titleBarCloseButton.Anchors = '1,0'
    titleBarCloseButton.Texture = 'corner2'

    -- definisce la dimensione della messagebox
    local dlgFrame = baseInput:Append('DialogFrame')
    dlgFrame.W = '100%'
    dlgFrame.H = '100%'
    dlgFrame.Columns = 1
    dlgFrame.Rows = 2
    dlgFrame.Anchors = '0,1'
    dlgFrame[1][1].SizePolicy = 'Fixed'
    dlgFrame[1][1].size = 60
    dlgFrame[1][2].SizePolicy = 'Fixed'
    dlgFrame[1][2].size = 60

    -- definisce il sottotitolo della messagebox
    local subTitle = dlgFrame:Append('UIObject')
    subTitle.Text = 'Sottotitolo della messagebox'
    subTitle.ContentDriven = 'Yes'
    subTitle.ContentWidth = 'No'
    subTitle.textAutoAdjust = 'Yes'
    subTitle.Anchors = '0,0'
    subTitle.Padding = '20, 15'
    subTitle.Font = 'Medium20'
    subTitle.HasHover = 'No'
    subTitle.BackColor = Root{}.ColorTheme.ColorGroups.Global.InvalidGridPosition

    -- definisce la dimensione del tasto Apply
    local buttonGrid = dlgFrame:Append('UILayoutGrid')
    buttonGrid.Columns = 1
    buttonGrid.Rows = 1
    buttonGrid.Anchors = '0,1'

    -- definisce il contenuto del pulsante Apply
    local button = buttonGrid:Append('Button')
    button.Anchors = '0,0'
    button.HasHover = 'Yes'
    button.TextShadow = 1
    button.TextAlignementH = 'Centre'
    button.Text = 'Apply'
    button.Font = 'Medium20'
    button.BackColor = Root{}.ColorTheme.ColorGroups.Global.PartlySelected
    button.PluginComponent = myHandler
    button.Clicked = 'ButtonClicked'


end
return Main