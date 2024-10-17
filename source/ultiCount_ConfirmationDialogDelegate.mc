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
// requires a useCase to be passed as a number to handle the different types of confirmation
// useCase = 0 : asking user if they want to exit the app
// useCase = 1 : asking user if they want to reset the game
class ConfirmationDialogDelegate extends WatchUi.ConfirmationDelegate {
    private var _useCase;

    //! Constructor
    //! @param view The app view
    public function initialize(useCase) {
        ConfirmationDelegate.initialize();
        _useCase = useCase;
    }

    //! Handle a confirmation selection
    //! @param value The confirmation value
    //! @return true if handled, false otherwise
    public function onResponse(value as Confirm) as Boolean {
        if (value == WatchUi.CONFIRM_YES) {
        //only interested in confirmations
            switch(_useCase){
                case 0:
                    //exit the app
                    System.exit();
                case 1:
                    //reset the game
                    Application.getApp().getMainView().resetGame(true);
                    break;
                case 2:
                    //load previous game
                    Application.getApp().getMainView().loadGameDetails(Application.getApp().getStoredGameDetails());
                    break;
            }
        } 
        return true;
    }
}