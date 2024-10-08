import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Graphics;

class myAppSettingsMenuDelegate extends WatchUi.Menu2InputDelegate {
    private var _genderMenu = Application.getApp().getGenderMenu();   
    
    function initialize() {
        Menu2InputDelegate.initialize();
    }
    
    public function onSelect(item as MenuItem) as Void {
                   
        var _theItemLabel = item.getLabel() as String;    

        if (_theItemLabel.equals("Initial Gender Ratio")) {
            // Ensure genderMenu is displaying correctly
            // then push the gender ratio menu             
            updateGenderInMenu(Application.getApp());
            WatchUi.pushView(_genderMenu, new myAppSettingsSubMenuDelegate(), WatchUi.SLIDE_UP);
        }else if (_theItemLabel.equals("About")){
            // Push the about View
            var _aboutView = new AboutView();
            WatchUi.pushView(_aboutView, new AboutViewDelegate(_aboutView,false), WatchUi.SLIDE_BLINK);
        } else if (_theItemLabel.equals("Exit App")){
            //Call the exitApp function of the App - confirms app exit with user
            Application.getApp().exitApp();
        }
    }
    //! Handle the back key being pressed
    public function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_BLINK);
    }
}

//! This is the menu input delegate shared by all the basic sub-menus in the application
class myAppSettingsSubMenuDelegate extends WatchUi.Menu2InputDelegate {

private var _startingGender = Application.getApp().getStartingGender();
    //! Constructor
    public function initialize() {
        Menu2InputDelegate.initialize();        
    }

    //! Handle an item being selected
    //! @param item The selected menu item
    public function onSelect(item as MenuItem) as Void {
        _startingGender = Application.getApp().getStartingGender();
        var _idTwo = item.getId().toString() as String;
        
        if (! _idTwo.equals(_startingGender)) {            
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
       
    _genderMenu.getItem(0).setIcon(myFemaleIcon);
    _genderMenu.getItem(1).setIcon(myMaleIcon);
    
}