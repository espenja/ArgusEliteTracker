# Changelog
All notable changes to this project will be documented in this file.

## [1.1.1] - 2017-09-27
### Added
- TomTom integration. Right click elite name to add TomTom waypoint.

### Changed
- Reduced time between searches

## [1.1.0] - 2017-09-24
### Added
- Ability to join groups and create groups when no groups are found.
- Ability to leave groups 
- Searches for world quests via the Quest Dungeon finder when clicking the elite name
- Frame can grow upwards.
- Force hide elites by using the Edit button.
- Ability to show elites that are World Quests even though force hidden is turned on.

### Changed
- Restructured code base
- Less loops
- Fix bug where world quests for elites would not trigger as world quests in the addon


## [1.0.7] - 2017-09-14
### Changed
- Fixed a bug where an open world map would switch to Krokuun if searching for elites at the same time
- Fixed frame reloading if settings are changed in the options dialog
- Fixed when to load addon based on options

## [1.0.7-beta] - 2017-09-11
### Added
- Settings with options dialog and integration with the game's settings menus.
- Option to show automatically when entering Argus.
- Option to hide all killed elites
- Option to show only elites with group results
- Added all languages to filter when searching for single elite groups. This might strengthen search results.
- Added button to main frame to open settings window
- Added two new triggers, /aet config and /aet options to open settings window

### Changed
- Better single elite search functionality. Should return more groups than search all on average.
- Fixed duplicate group result bug when searching for groups.
- Fixed loading all world quests at the same time. Thanks @tdevnich10!
- Fixed handling of when to load the addon frame.


## [1.0.6] - 2017-09-10
### Added
- ArgusEliteTracker can now be toggled by just writing /aet.
- Button for minimizing the frame. When minimized only shows the header.

### Changed
- Frame now sizes to the height of number of elites while maintaining its position.
- Reset button is now a small button with the letter 'R'.

## [1.0.5] - 2017-09-10
### Added
- New toggle command so the opening of closing the window can be macroed easily (/aet toggle).
- Added missing rares. Thanks to user datpro for helping out!

### Changed
- Alphabetized list of elites. Thanks to user datpro for helping out!
- Fixed spelling mistakes in slash commands help text.

## [1.0.4] - 2017-09-09
### Added
- This changelog. Hello :)
- See which elites you already have killed.
- See which elites belong to a world quest if you are in the specific zone.
For some reason this only works some of the time, and sometimes only after
opening the world map.
- Disable all search buttons while search is ongoing.

### Changed
- Fixed height of frame to prevent frame jumping around.
- Height of items to lessen the space taken by the frame
- Buttons for zones now indicate which zone is selected
- All search functionality now searches all search terms each time
- Frame should not open if not specifically told to after closing
- Remember frame position