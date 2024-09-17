import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class myAppApp extends Application.AppBase {
    public var _someScore;
    private var _view;
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
    function getInitialView() as [Views] or [Views, InputDelegates] {
        _view = new myAppView();
        return [ _view, new myAppDelegate() ];
    }

    // Returns main view Instance
    function getView() as myAppView {
        return _view;
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



}

function getApp() as myAppApp {
    return Application.getApp() as myAppApp;
}

//Returns main view instance
function getView() as myAppView{
    return Application.getApp().getView();
}

// Returns genderMenu
function getGenderMenu() as Menu2 {
    return Application.getApp().getGenderMenu();
}

// Returns genderMenu
function getStartingGender() as String {
    return Application.getApp().getStartingGender();
}

