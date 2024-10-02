import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class myAppApp extends Application.AppBase {
    public var _someScore;
    private var _mainView;
    private var _startingGender;
    private var _genderMenu;
    private var _settingsMenu;
    

    function initialize() {
        AppBase.initialize();
        _someScore = 0;
        _startingGender = "fourWomen";
        _genderMenu = new Rez.Menus.genderMenu();
        _settingsMenu = new Rez.Menus.SettingsMenu();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    // for SDK 7+
    function getInitialView() as [Views] or [Views, InputDelegates] {
        _mainView = new mainGameView();
        //return [ _mainView, new myAppDelegate() ];
        return [ _mainView, new gameViewInputDelegate() ];
    }

    // //for SDK <7.0.0
    //   public function getInitialView() as Array<Views or InputDelegates>? {
    //     _mainView = new mainGameView();
    //     return [_mainView, new gameViewInputDelegate()] as Array<Views or InputDelegates>;
    // }

    // Returns main view Instance
    function getMainView() as mainGameView {
        return _mainView;
    }

    // Returns genderMenu
    function getGenderMenu() as Menu2 {
        return _genderMenu;
    }
    
    // Returns settingsMenu
    function getSettingsMenu() as Menu2 {
        return _settingsMenu;
    }

    // Returns startingGender
    function getStartingGender() as String {
        return _startingGender;
    }

    function changeStartingGender() as Void{
        if (_startingGender.equals("fourWomen")){
            _startingGender = "fourMen";
        } else {
            _startingGender = "fourWomen";
        }
    }

    public function goodVibes(vibeType as Number) as Void{
        if (Attention has :vibrate) {
            var vibeData;
            switch (vibeType) {
                case 1:
                    // 50% Strength, 0.25 seconds   
                    vibeData = [ new Attention.VibeProfile(50, 250)];
                    break;                
                case 2: 
                    // 50% Strength, 0.15 seconds
                    vibeData = [ new Attention.VibeProfile(50, 150)];
                    break;
                case 3:                     
                    // 50% Strength, 0.15 seconds, off for 0.05, 50% Strength, 0.15 seconds
                    vibeData = 
                        [
                         new Attention.VibeProfile(50, 150),
                         new Attention.VibeProfile(0, 75),
                         new Attention.VibeProfile(50, 150)
                        ];
                    break;
                case 4:                    
                    // 50% Strength, 0.15 seconds, off for 0.1, 25% Strength, 0.15 seconds
                    vibeData = 
                        [
                         new Attention.VibeProfile(50, 200),
                         new Attention.VibeProfile(0, 100),
                         new Attention.VibeProfile(25, 150)
                        ];
                    break;
                default: {                    
                    // 50% Strength, 0.25 seconds
                    vibeData = [ new Attention.VibeProfile(50, 250)];
                }

            }
            Attention.vibrate(vibeData);
        }
    }

    function exitApp () as Void {
        var dialog = new WatchUi.Confirmation("Really want to Exit?");
        WatchUi.pushView(dialog, new ConfirmationDialogDelegate(), WatchUi.SLIDE_IMMEDIATE);
    }

}

function getApp() as myAppApp {
    return Application.getApp() as myAppApp;
}

//Returns main view instance
function getMainView() as mainGameView{
    return Application.getApp().getMainView();
}

// Returns genderMenu
function getGenderMenu() as Menu2 {
    return Application.getApp().getGenderMenu();
}

// Returns genderMenu
function getStartingGender() as String {
    return Application.getApp().getStartingGender();
}

