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
import Toybox.System;

//! Input handler for the confirmation dialog
class ConfirmationDialogDelegate extends WatchUi.ConfirmationDelegate {


    //! Constructor
    //! @param view The app view
    public function initialize() {
        ConfirmationDelegate.initialize();
        
    }

    //! Handle a confirmation selection
    //! @param value The confirmation value
    //! @return true if handled, false otherwise
    public function onResponse(value as Confirm) as Boolean {
        if (value == WatchUi.CONFIRM_NO) {
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        } else {
            System.exit();
        }
        return true;
    }
}