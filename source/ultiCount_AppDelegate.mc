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