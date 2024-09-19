import Toybox.Lang;
import Toybox.WatchUi;

class myAppDelegate extends WatchUi.BehaviorDelegate {
    //private var _myThing as myAppView;
    private var _view = getView();
    private var _settingsMenu = Application.getApp().getSettingsMenu();

    public function initialize() {
        BehaviorDelegate.initialize();
        //_myThing = view;
        //WatchUi.View.initialize();
    }

    function onMenu() as Boolean {
        //WatchUi.pushView(new Rez.Menus.InGameMenu(), new InGameMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onBack() as Boolean {
        _view.startNewPotentialPointClock();
        WatchUi.pushView(new Rez.Menus.InGameMenu(), new InGameMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() as Boolean {
        //_view.startStopTimer();
        return true;
    }
     

    public function onNextPage() as Boolean {
        WatchUi.pushView(_settingsMenu, new myAppSettingsMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}

class MyInputDelegate extends WatchUi.InputDelegate {
    private var _view = getView();
    private var _settingsMenu = Application.getApp().getSettingsMenu();

    public function initialize() {
        InputDelegate.initialize();
    }

    function onKey(keyEvent) {
        if(keyEvent.getKey() == 4){
            _view.startStopTimer();
        }else if(keyEvent.getKey() == 5){
            _view.startNewPotentialPointClock();
            WatchUi.pushView(new Rez.Menus.InGameMenu(), new InGameMenuDelegate(), WatchUi.SLIDE_UP);
        }else if(keyEvent.getKey() == 8){
            WatchUi.pushView(_settingsMenu, new myAppSettingsMenuDelegate(), WatchUi.SLIDE_UP);
        }

        //System.println(keyEvent.getKey());         // e.g. KEY_MENU = 7
        return true;
    }

    // function onTap(clickEvent) {
    //     System.println(clickEvent.getType());      // e.g. CLICK_TYPE_TAP = 0
    //     return true;
    // }

    // function onSwipe(swipeEvent) {
    //     System.println(swipeEvent.getDirection()); // e.g. SWIPE_DOWN = 2
    //     return true;
    // }
}