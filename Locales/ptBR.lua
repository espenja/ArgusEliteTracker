local L = ArgusEliteTracker.L
local S = ArgusEliteTracker.S
local W = ArgusEliteTracker.W
local locale = "ptBR"


ArgusEliteTracker.RegisterSearchTerms[locale] = function()
    -- Search terms in locale first
    -- Missing translations are commented. Please uncomment and add translation.

    --S["Commander Endaxis"][locale]          = ""
    --S["Commander Sathrenael"][locale]       = ""
    --S["Commander Vecaya"][locale]           = ""
    --S["Imp Mother Laglath"][locale]         = ""
    --S["Khazaduum"][locale]                  = ""
    --S["Naroua"][locale]                     = ""
    --S["Siegemaster Voraan"][locale]         = ""
    --S["Sister Subversia"][locale]           = ""
    --S["Talestra the Vile"][locale]          = ""
    --S["Tar Spitter"][locale]                = ""
    --S["Tereck the Selector"][locale]        = ""
    --S["Vagath the Betrayed"][locale]        = ""

    --S["Admiral Rel'var"][locale]            = ""
    --S["All-Seer Xanarian"][locale]          = ""
    --S["Blistermaw"][locale]                 = ""
    --S["Chief Alchemist Munculus"][locale]   = ""
    --S["Commander Texlaz"][locale]           = ""
    --S["Doomcaster Suprax"][locale]          = ""
    --S["Gar'zoth"][locale]                   = ""
    --S["Houndmaster Kerrax"][locale]         = ""
    --S["Inquisitor Vethroz"][locale]         = ""
    --S["Lieutenant Xakaar"][locale]          = ""
    --S["Mistress Il'thendra"][locale]        = ""
    --S["Mother Rosula"][locale]              = ""
    --S["Puscilla"][locale]                   = ""
    --S["Rezira the Seer"][locale]            = ""
    --S["Squadron Commander Vishax"][locale]  = ""
    --S["The Many-Faced Devourer"][locale]    = ""
    --S["Varga"][locale]                      = ""
    --S["Ven'orn"][locale]                    = ""
    --S["Void Warden Valsuran"][locale]       = ""
    --S["Vrax'thul"][locale]                  = ""
    --S["Watcher Aival"][locale]              = ""
    --S["Worldsplitter Skuul"][locale]        = ""
    --S["Wrath-Lord Yarez"][locale]           = ""

    --S["Ataxon"][locale]                     = ""
    --S["Baruut the Bloodthirsty"][locale]    = ""
    --S["Captain Faruq"][locale]              = ""
    --S["Commander Xethgar"][locale]          = ""
    --S["Feasel the Muffin Thief"][locale]    = ""
    --S["Herald of Chaos"][locale]            = ""
    --S["Instructor Tarahna"][locale]         = ""
    --S["Jed'hin Champion Vorusk"][locale]    = ""
    --S["Kaara the Pale"][locale]             = ""
    --S["Overseer Y'Beda"][locale]            = ""
    --S["Overseer Y'Morna"][locale]           = ""
    --S["Overseer Y'Sorna"][locale]           = ""
    --S["Sabuul"][locale]                     = ""
    --S["Shadowcaster Voruun"][locale]        = ""
    --S["Skreeg the Devourer"][locale]        = ""
    --S["Slithon the Last"][locale]           = ""
    --S["Sorolis the Ill-Fated"][locale]      = ""
    --S["Soultwisted Monstrosity"][locale]    = ""
    --S["Turek the Lucid"][locale]            = ""
    --S["Umbraliss"][locale]                  = ""
    --S["Venomtail Skyfin"][locale]           = ""
    --S["Vigilant Kuro"][locale]              = ""
    --S["Vigilant Thanos"][locale]            = ""
    --S["Wrangler Kravos"][locale]            = ""
    --S["Zul'tan the Numerous"][locale]       = ""

end


ArgusEliteTracker.OverrideLanguage[locale] = function()
    -- Other translations
    -- Missing translations are commented. Please uncomment and add translation.

    ----http://pt.wowhead.com/npc=124775
    --L["Commander Endaxis"]          = "Comandante Endáxis"
    ----http://pt.wowhead.com/npc=122912
    --L["Commander Sathrenael"]       = "Comandante Sathrenael"
    ----http://pt.wowhead.com/npc=122911
    --L["Commander Vecaya"]           = "Comandante Vecaya"
    ----http://pt.wowhead.com/npc=125820
    --L["Imp Mother Laglath"]         = "Mãe dos Diabretes Laglath"
    ----http://pt.wowhead.com/npc=125824
    --L["Khazaduum"]                  = "Khazaduum"
    ----http://pt.wowhead.com/npc=126419
    --L["Naroua"]                     = "Naroua"
    ----http://pt.wowhead.com/npc=120393
    --L["Siegemaster Voraan"]         = "Mestre de Cerco Voraan"
    ----http://pt.wowhead.com/npc=123464
    --L["Sister Subversia"]           = "Irmã Subvérsia"
    ----http://pt.wowhead.com/npc=123689
    --L["Talestra the Vile"]          = "Talestra, a Torpe"
    ----http://pt.wowhead.com/npc=125479
    --L["Tar Spitter"]                = "Cospe-piche"
    ----http://pt.wowhead.com/npc=124804
    --L["Tereck the Selector"]        = "Tereck, o Seletor"
    ----http://pt.wowhead.com/npc=125388
    --L["Vagath the Betrayed"]        = "Vagath, o Traído"

    --http://pt.wowhead.com/npc=127090
    --L["Admiral Rel'var"]            = "Almirante Rel'var"
    --http://pt.wowhead.com/npc=127096
    --L["All-Seer Xanarian"]          = "Onividente Xanarian"
    --http://pt.wowhead.com/npc=122958
    --L["Blistermaw"]                 = "Gorjapus"
    --http://pt.wowhead.com/npc=127376
    --L["Chief Alchemist Munculus"]   = "Chefe Alquimista Munculus"
    --http://pt.wowhead.com/npc=127084
    --L["Commander Texlaz"]           = "Comandante Texlaz"
    --http://pt.wowhead.com/npc=127703
    --L["Doomcaster Suprax"]          = "Lança-ruínas Suprax"
    --http://pt.wowhead.com/npc=122999
    --L["Gar'zoth"]                   = "Gar'zoth"
    --http://pt.wowhead.com/npc=127288
    --L["Houndmaster Kerrax"]         = "Mestre de Matilha Kerrax"
    --http://pt.wowhead.com/npc=126946
    --L["Inquisitor Vethroz"]         = "Inquisidor Vethroz
    --http://pt.wowhead.com/npc=126254
    --L["Lieutenant Xakaar"]          = "Tenente Xakaar"
    --http://pt.wowhead.com/npc=122947
    --L["Mistress Il'thendra"]        = "Senhora Il'thendra"
    --http://pt.wowhead.com/npc=127705
    --L["Mother Rosula"]              = "Mãe Rosula"
    --http://pt.wowhead.com/npc=126040
    --L["Puscilla"]                   = "Puscilla"
    --http://pt.wowhead.com/npc=127706
    --L["Rezira the Seer"]            = "Rezira, o Vidente"
    --http://pt.wowhead.com/npc=127700
    --L["Squadron Commander Vishax"]  = "Comandante de Esquadra Vishax"
    --http://pt.wowhead.com/npc=127581
    --L["The Many-Faced Devourer"]    = "O Devorador das Muitas Faces"
    --http://pt.wowhead.com/npc=126208
    --L["Varga"]                      = "Varga"
    --http://pt.wowhead.com/npc=126115
    --L["Ven'orn"]                    = "Ven'orn"
    --http://pt.wowhead.com/npc=127300
    --L["Void Warden Valsuran"]       = "Guardião do Caos Valsuran"
    --http://pt.wowhead.com/npc=126199
    --L["Vrax'thul"]                  = "Vrax'thul"
    --http://pt.wowhead.com/npc=127291
    --L["Watcher Aival"]              = "Vigia Aival"
    --http://pt.wowhead.com/npc=127118
    --L["Worldsplitter Skuul"]        = "Racha-mundos Skuul"
    --http://pt.wowhead.com/npc=126338
    --L["Wrath-Lord Yarez"]           = "Senhor da Ira Yarez"


    --http://pt.wowhead.com/npc=126887
    --L["Ataxon"]                     = "Ataxon"
    --http://pt.wowhead.com/npc=126862
    --L["Baruut the Bloodthirsty"]    = "Baruut, o Sedento por Sangue"
    --http://pt.wowhead.com/npc=126869
    --L["Captain Faruq"]              = "Capitão Faruque"
    --http://pt.wowhead.com/npc=126910
    --L["Commander Xethgar"]          = "Comandante Xethgar"
    --http://pt.wowhead.com/npc=126864
    --L["Feasel the Muffin Thief"]    = "Feasel, o Ladrão de Bolinhos"
    --http://pt.wowhead.com/npc=126896
    --L["Herald of Chaos"]            = "Arauto do Caos"
    --http://pt.wowhead.com/npc=126900
    --L["Instructor Tarahna"]         = "Instrutora Tarahna"
    --http://pt.wowhead.com/npc=126899
    --L["Jed'hin Champion Vorusk"]    = "Vorusk, Campeão Jed'hin"
    --http://pt.wowhead.com/npc=126860
    --L["Kaara the Pale"]             = "Kaara, o Pálido"
    --http://pt.wowhead.com/npc=124440
    --L["Overseer Y'Beda"]            = "Feitora Y'Beda"
    --http://pt.wowhead.com/npc=125498
    --L["Overseer Y'Morna"]           = "Feitora Y'Morna"
    --http://pt.wowhead.com/npc=125497
    --L["Overseer Y'Sorna"]           = "Feitora Y'Sorna"
    --http://pt.wowhead.com/npc=126898
    --L["Sabuul"]                     = "Sabuul"
    --http://pt.wowhead.com/npc=122838
    --L["Shadowcaster Voruun"]        = "Lança-sombras Voruun"
    --http://pt.wowhead.com/npc=126912
    --L["Skreeg the Devourer"]        = "Escrargo, o Devorador"
    --http://pt.wowhead.com/npc=126913
    --L["Slithon the Last"]           = "Resvalon, o Derradeiro"
    --http://pt.wowhead.com/npc=126889
    --L["Sorolis the Ill-Fated"]      = "Sorolis, da Sina Desgraçada"
    --http://pt.wowhead.com/npc=126815
    --L["Soultwisted Monstrosity"]    = "Monstruosidade Almatorpe"
    --http://pt.wowhead.com/npc=126868
    --L["Turek the Lucid"]            = "Turek, o Lúcido"
    --http://pt.wowhead.com/npc=126885
    --L["Umbraliss"]                  = "Umbralíssimo"
    --http://pt.wowhead.com/npc=126867
    --L["Venomtail Skyfin"]           = "Corta-céu Caudaçonha"
    --http://pt.wowhead.com/npc=126866
    --L["Vigilant Kuro"]              = "Vigilante Kuro"
    --http://pt.wowhead.com/npc=126865
    --L["Vigilant Thanos"]            = "Vigilante Thanos"
    --http://pt.wowhead.com/npc=126852
    --L["Wrangler Kravos"]            = "Enlaçador Kravos"
    --http://pt.wowhead.com/npc=126908
    --L["Zul'tan the Numerous"]       = "Zul'tan, o Numeroso"


    -- UI Elements
    --L["Create"] = ""
    --L["Join"] = ""
    --L["Leave"] = ""
    --L["N/A"] = ""
    --L["*"] = ""
    --L["Killed"] = ""
    --L["WQ"] = ""
    --L["YES"] = ""
    --L["NO"] = ""
    --L["Applied to too many groups"] = ""
    --L["Joined from ArgusEliteTracker"] = ""
    --L["Group created with ArgusEliteTracker."] = ""
    --L["Argus Elite Tracker"] = ""
    --L["Search all"] = ""
    --L["E"] = "" -- E for edit
    --L["R"] = "" -- R for reset
    --L["?"] = "" -- Options menu
    --L["-"] = "" -- Minimize
    --L["+"] = "" -- Maximize
    --L["X"] = "" -- Close window
    ---- http://www.wowhead.com/zone=8574
    --L["Krokuun"] = ""
    ---- http://www.wowhead.com/zone=8899
    --L["Antoran Wastes"] = ""
    ---- http://www.wowhead.com/zone=8701
    --L["Mac'Aree"] = ""
    --L["Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00."] = ""
    --L["TOGGLE"] = ""
    --L["HELP"] = ""
    --L["HIDE"] = ""
    --L["SHOW"] = ""
    --L["OPTIONS"] = ""
    --L["CONFIG"] = ""
    --L["is loaded."] = ""

    --L["Argus Elite Tracker: Commands are |cFF00FF00help|r|cFFFFFF00, |cFF00FF00show|r|cFFFFFF00, |cFF00FF00hide|cFFFFFF00, |cFF00FF00toggle|r|cFFFFFF00, |cFF00FF00options|r|cFFFFFF00, |cFF00FF00config|r|cFFFFFF00"] = ""
    --L["Argus Elite Tracker: Slash commands are |cFF00FF00/aet|r|cFFFFFF00, |cFF00FF00/arguselitetracker|r|cFFFFFF00."] = ""
    --L["Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00."] = ""
    --L["Argus Elite Tracker is |cFF00FF00visible|r|cFFFFFF00."] = ""
    --L["Argus Elite Tracker |cFF00FF00toggled|r|cFFFFFF00."] = ""

    -- Options
    --L["Welcome to ArgusEliteTracker!"] = ""
    --L["Your local guide for guesstimating which elites are up."] = ""
    --L["Pressing search all is fine and dandy, but not the most accurate way!"] = ""
    --L["It looks like the WoW API limits the number of results to 100."] = ""
    --L["Clicking the name of an elite will search for that elite with specified search terms."] = ""
    --L["This should on average yield more correct group count numbers. If you should be bored :)"] = ""
    --L["Open automatically when entering an Argus zone"] = ""
    --L["Grow frame upwards"] = ""
    --L["Only show elites that have an active group"] = ""
    --L["... but still show all world quests if the elite has not been killed"] = ""
    --L["Hide elites that have already been killed"] = ""
    --L["If elites are force hidden, show them anyway if they are World Quests"] = ""
    --L["Commander of Argus mode"] = ""

    --L["Override search all language filter. Search in  the checked languages."] = ""

    --L["German (deDE)"] = ""
    --L["English (enUS)"] = ""
    --L["Spanish (Spain) (esES)"] = ""
    --L["Spanish (Latin America) (esMX)"] = ""
    --L["French (frFR)"] = ""
    --L["Italian (itIT)"] = ""
    --L["Brazilian Portugese (ptBR)"] = ""
    --L["Russian (ruRU)"] = ""
    --L["Korean (koKR)"] = ""
    --L["Simplified Chinese (zhCN)"] = ""
    --L["Traditional Chinese (zhTW)"] = ""

    -- L["deDE"] = ""
    -- L["enUS"] = ""
    -- L["esES"] = ""
    -- L["esMX"] = ""
    -- L["frFR"] = ""
    -- L["itIT"] = ""
    -- L["koKR"] = ""
    -- L["ptBR"] = ""
    -- L["ruRU"] = ""
    -- L["zhCN"] = ""
    -- L["zhTW"] = ""
end


ArgusEliteTracker.OverrideUiSettings[locale] = function()

    -- Language specific UI settings

    W.FontSizeBig = 12
    W.FontSizeSmall = 10

    W.AetWindowWidth = 300
    W.AetWindowHeight = 24
    W.TitleBarWidth = W.AetWindowWidth
    W.TitleBarHeight = 24
    W.ElitesContainerWidth = W.AetWindowWidth
    W.ElitesContainerHeight = 50
    W.SearchAllButtonWidth = 58
    W.ButtonHeight = 15
    W.SmallButtonWidth = 15
    W.ZoneButtonHeight = 20
    W.ZoneKrokuunButtonWidth =  75
    W.ZoneAntoranWastesButtonWidth = 120
    W.ZoneMacAreeButtonWidth = 75

    W.EliteButtonsHeight = 16
    W.GroupButtonWidth = 40
    W.EliteStatusWidth = 50
    W.EliteYOffset = 15

end

if ArgusEliteTracker.AvailableLocales[locale] == nil then
    return
end

-- ArgusEliteTracker.RegisteredSearchTerms[locale] = L["Portugese"]
-- ArgusEliteTracker.RegisterSearchTerms[locale]()

if not(GetLocale() == locale) then
    return
end

ArgusEliteTracker.OverrideLanguage[locale]()
ArgusEliteTracker.OverrideUiSettings[locale]()