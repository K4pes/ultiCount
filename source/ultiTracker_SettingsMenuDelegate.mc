import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Graphics;

class myAppSettingsMenuDelegate extends WatchUi.Menu2InputDelegate {
    private var _genderMenu = getGenderMenu();   
    
    function initialize() {
        Menu2InputDelegate.initialize();
    }
    
    public function onSelect(item as MenuItem) as Void {
        var id = item.getId().toString() as String;
            if (id.equals("genderMenu")) {
                // When the toggle menu item is selected, push the gender ratio menu             
                updateGenderInMenu(Application.getApp());
                WatchUi.pushView(_genderMenu, new myAppSettingsSubMenuDelegate(), WatchUi.SLIDE_UP);
            } else if (id.equals("exitApp")){
                //in future have confirmation dialog here
                System.exit();
            }
    }
    //! Handle the back key being pressed
    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}

//! This is the menu input delegate shared by all the basic sub-menus in the application
class myAppSettingsSubMenuDelegate extends WatchUi.Menu2InputDelegate {
//private var _genderMenu = getGenderMenu();
private var _startingGender = getStartingGender();
    //! Constructor
    public function initialize() {
        Menu2InputDelegate.initialize();        
    }

    //! Handle an item being selected
    //! @param item The selected menu item
    public function onSelect(item as MenuItem) as Void {
        _startingGender = getStartingGender();
        var idTwo = item.getId().toString() as String;
        
        if (! idTwo.equals(_startingGender)) {            
            Application.getApp().changeStartingGender();            
            updateGenderInMenu(Application.getApp());        
         }
        
        
    }

    //! Handle the back key being pressed
    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }

    //! Handle the done item being selected
    public function onDone() as Void {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }

}

//this functions updates icons and sublabels in menu to match the current "Starting Gender"
public function updateGenderInMenu(_thisApp) as Void {
    var _startingGender = _thisApp.getStartingGender();
    var _genderMenu = _thisApp.getGenderMenu();
    var _settingsMenu = _thisApp.getSettingsMenu();
    var myFemaleIcon;
    var myMaleIcon;
    var _labelString;
    if (_startingGender.equals("fourWomen")){
        myFemaleIcon = new WatchUi.Bitmap({:rezId=>Rez.Drawables.gender_women_highlight,:locX=>10,:locY=>30});
        myMaleIcon = new WatchUi.Bitmap({:rezId=>Rez.Drawables.gender_men_LightOutline,:locX=>10,:locY=>30});
        _labelString = "4 Female-matching";
    } else {
        myFemaleIcon = new WatchUi.Bitmap({:rezId=>Rez.Drawables.gender_women_LightOutline,:locX=>10,:locY=>30});
        myMaleIcon = new WatchUi.Bitmap({:rezId=>Rez.Drawables.gender_men_highlight,:locX=>10,:locY=>30});
        _labelString = "4 Male-matching";
    }
    
    _settingsMenu.getItem(0).setSubLabel(_labelString);

    var _myMenuItem = _genderMenu.getItem(0);
    _myMenuItem.setIcon(myFemaleIcon);
       
    _genderMenu.getItem(0).setIcon(myFemaleIcon);
    _genderMenu.getItem(1).setIcon(myMaleIcon);
    
}