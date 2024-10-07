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