Senpais = Senpais or {}
Senpais.Functions = Senpais.Functions or {}
Senpais.Functions.Create = Senpais.Functions.Create or {}
Senpais.Functions.Replace = Senpais.Functions.Replace or {}
Senpais.Functions.GUI = Senpais.Functions.GUI or {}
Senpais.Functions.GUI.Add = Senpais.Functions.GUI.Add or {}
Senpais.Functions.Script = Senpais.Functions.Script or {}
Senpais.Functions.Coupling = Senpais.Functions.Coupling or {}
Senpais.Functions.SmarterTrains = Senpais.Functions.SmarterTrains or {}
Senpais.Functions.Math = Senpais.Functions.Math or {}
Senpais.Sprites = Senpais.Sprites or {}
Senpais.MaxPower1kJEnergy = 1000

Senpais.Sprites = {}
Senpais.Sprites["Senpais-okay"] = "okay"
Senpais.Sprites["Senpais-plus"] = "plus"
Senpais.Sprites["Senpais-nope"] = "nope"
Senpais.Sprites["Senpais-S"] = "S"
Senpais.Sprites["Train-Count"] = "train"
Senpais.Sprites["Wagon-Count"] = "wagon"
Senpais.Sprites["FluidWagon-Count"] = "fluidwagon"
Senpais.Sprites["Senpais-Smart-Stop-Icon"] = "smart-stop-icon"

Senpais.GUIButtons = {}
Senpais.GUIButtons["SenpaisSmarterTrainsGUIMainButton"] = true
Senpais.GUIButtons["SenpaisCountTrainsButton"] = true
Senpais.GUIButtons["SenpaisCountWagonsButton"] = true
Senpais.GUIButtons["SenpaisCountFluidWagonsButton"] = true
Senpais.GUIButtons["SenpaisElectricTrainsStatesButton"] = true

Senpais.Signals = {}
Senpais.Signals["Signal_Couple"] = { type = "virtual", name = "signal-couple" }
Senpais.Signals["Signal_Uncouple"] = { type = "virtual", name = "signal-decouple" }