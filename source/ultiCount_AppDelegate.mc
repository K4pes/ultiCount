// UltiCount: A Garmin Connect IQ App to help keep track during ultimate frisbee games
// Copyright (C) 2024  K4pes 

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//========================================================================

import Toybox.Lang;
import Toybox.WatchUi;

class GameViewInputDelegate extends WatchUi.InputDelegate {
    private var _mainView =Application.getApp().getMainView();
    private var _settingsMenu = Application.getApp().getSettingsMenu();

    public function initialize() {
        InputDelegate.initialize();
    }

    function onKey(keyEvent) {
        if(keyEvent.getKey() == 4){
            Application.getApp().goodVibes(1);
            _mainView.startStopTimer();
        }else if(keyEvent.getKey() == 5){
            _mainView.startNewPotentialPointClock();
            WatchUi.pushView(new Rez.Menus.InGameMenu(), new InGameMenuDelegate(), WatchUi.SLIDE_UP);
        }else if(keyEvent.getKey() == 8){
            WatchUi.pushView(_settingsMenu, new myAppSettingsMenuDelegate(), WatchUi.SLIDE_UP);
        }

        //System.println(keyEvent.getKey());         // e.g. KEY_MENU = 7
        return true;
    }

    function onSwipe(swipeEvent) {
        if(swipeEvent.getDirection() == 0){
            //swipe up
            _mainView.startNewPotentialPointClock();
            WatchUi.pushView(new Rez.Menus.InGameMenu(), new InGameMenuDelegate(), WatchUi.SLIDE_UP);
        }else if(swipeEvent.getDirection() == 2){
            //swipe down
            WatchUi.pushView(_settingsMenu, new myAppSettingsMenuDelegate(), WatchUi.SLIDE_DOWN);
        }

        // returning true to block all system handling of swipes
        return true;
    }


    //Handle all other possible touch actions to prevent any unwanted behaviour
    //=========================================================================

    function onDrag(dragEvent){
        return true;
    }
    
    function onTap(clickEvent) {
        return true;
    }

    function onFlick(flickEvent) {
        return true;
    }
    
    function onHold(clickEvent) {
        return true;
    }

    function onRelease(clickEvent) {
        return true;
    }

    function onSelectable(selectableEvent) {
        return true;
    }
}