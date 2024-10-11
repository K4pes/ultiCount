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
import Toybox.System;
import Toybox.WatchUi;

class InGameMenuDelegate extends WatchUi.MenuInputDelegate {

    private var _mainView =Application.getApp().getMainView();
    
    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :item_1) {
            _mainView.addScore(1);
        } else if (item == :item_2) {
            _mainView.addScore(2);
        } else if (item == :item_4) {
            _mainView.correctScore(1);
        } else if (item == :item_5) {
            _mainView.correctScore(2);
        }
    }

}