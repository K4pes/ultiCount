import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.System;
import Toybox.Attention;

class myAppView extends WatchUi.View {
    public var _scoreLight as Number = 0;
    public var _scoreDark as Number = 0;
    public var _scoreLightLabel;
    public var _scoreDarkLabel;
    public var _timeRunning as Boolean = false;  
    private var _elapsedSecondsGame as Number = 0;
    private var _elapsedSecondsPoint as Number = 0;
    private var _potentialElapsedSecondsPoint as Number = 0;
    var _timer1;
    var _myTime;
    var _gameTimeLabel;
    var _pointTimeLabel;
    var _clockLabel;
    var _ratioWomenPng;
    var _ratioMenPng;
    var _circleOne;
    var _circleTwo;
    var _circleThree;
    var _circleFour;
    //_typeTitleElement = findDrawableById("type_title");

    public function initialize() {
        View.initialize();
        //_scoreLight = 0;
        //_scoreDark = 0;
    }

    // Load your resources here
    public function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
        _scoreLightLabel = findDrawableById("id_scoreLights");
        _scoreDarkLabel = findDrawableById("id_scoreDarks");
        _timer1 = new Timer.Timer();
        // _timer1.start(method(:callback1), 1000, true);
        
        _gameTimeLabel = findDrawableById("id_gameTimer");
        _pointTimeLabel = findDrawableById("id_pointTimer");
        _clockLabel = findDrawableById("id_clock");
        _ratioWomenPng = findDrawableById("gender_women");
        _ratioMenPng = findDrawableById("gender_men");
        _circleOne = findDrawableById("circle_one");
        _circleTwo = findDrawableById("circle_two");
        _circleThree = findDrawableById("circle_three");
        _circleFour = findDrawableById("circle_four");
        calculateRatio();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        _scoreLightLabel.setText(_scoreLight.format("%02d"));        
        _scoreDarkLabel.setText(_scoreDark.format("%02d"));
        _gameTimeLabel.setText(convertSecondsToTimerString(_elapsedSecondsGame));
        _pointTimeLabel.setText(convertSecondsToTimerString(_elapsedSecondsPoint));
        _myTime = System.getClockTime();
        _clockLabel.setText(_myTime.hour.format("%02d") + ":" +  _myTime.min.format("%02d"));
        calculateRatio();
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    public function addScore(team as Number) as Void {
        //reset point clock with time since menu button press
        _elapsedSecondsPoint= _potentialElapsedSecondsPoint;
        
        if (team == 1){
            _scoreLight++;
        } else {
            _scoreDark++;
        }
        WatchUi.requestUpdate();
        //calculateRatio();
    }
    public function correctScore(team as Number) as Void {
        //might need to do some correcting to time here... later
        
        if (team == 1){
            if(_scoreLight > 0){
                _scoreLight--;
            }
        } else {
            if(_scoreDark > 0){
                _scoreDark--;
            }
        }
        //calculateRatio();
        WatchUi.requestUpdate();
    }

    public function calculateRatio() as Void{
        //add scores, calculate, and display which is the correct Gender Ratio
        // A = 0, B = 1
        var _boolTrueStartingWomen ;
        var _boolTrueStartingMen ;
        if (Application.getApp().getStartingGender().equals("fourWomen")) {
            _boolTrueStartingWomen = true;
            _boolTrueStartingMen = false;
        } else {
            _boolTrueStartingWomen = false;
            _boolTrueStartingMen = true;            
        }


        var scoreSum = _scoreDark + _scoreLight;
        var scoreMod = scoreSum % 4;
        switch (scoreMod) {
            case 0:
                _ratioWomenPng.setVisible(_boolTrueStartingWomen);
                _ratioMenPng.setVisible(_boolTrueStartingMen);
                _circleOne.setVisible(true);
                _circleTwo.setVisible(false);
                _circleThree.setVisible(false);
                _circleFour.setVisible(false);
                break;
            case 1:
                _ratioWomenPng.setVisible(_boolTrueStartingMen);
                _ratioMenPng.setVisible(_boolTrueStartingWomen);
                _circleOne.setVisible(true);
                _circleTwo.setVisible(true);
                _circleThree.setVisible(false);
                _circleFour.setVisible(false);
                break;
            case 2:
                _ratioWomenPng.setVisible(_boolTrueStartingMen);
                _ratioMenPng.setVisible(_boolTrueStartingWomen);
                _circleOne.setVisible(true);
                _circleTwo.setVisible(true);
                _circleThree.setVisible(true);
                _circleFour.setVisible(false);
                break;
            case 3:
                _ratioWomenPng.setVisible(_boolTrueStartingWomen);
                _ratioMenPng.setVisible(_boolTrueStartingMen);
                _circleOne.setVisible(true);
                _circleTwo.setVisible(true);
                _circleThree.setVisible(true);
                _circleFour.setVisible(true);
                break;
        }
        

    }

    //! Callback for timer 1
    public function callback1() as Void {
        _elapsedSecondsGame++;
        _elapsedSecondsPoint++;
        _potentialElapsedSecondsPoint++;
        if (_elapsedSecondsPoint == 46) {
            WatchUi.showToast("Off. Ready", {:icon=>Rez.Drawables.warningToastIcon});         
            goodVibes();
        }else if (_elapsedSecondsPoint == 61) {
            WatchUi.showToast("Def. Ready", {:icon=>Rez.Drawables.warningToastIcon});
            goodVibes();
        }

        WatchUi.requestUpdate();
    }

    public function startNewPotentialPointClock() as Void {
        _potentialElapsedSecondsPoint = 0;
    }

    function convertSecondsToTimerString(totalSeconds) {
        var hours = totalSeconds / 3600;
        var minutes = (totalSeconds /60) % 60;
        var seconds = totalSeconds % 60;
        var timeString = format("$1$:$2$:$3$", [hours.format("%02d"), minutes.format("%02d"), seconds.format("%02d")]);
        return timeString;
    }

    public function goodVibes() as Void{
        if (Attention has :vibrate) {
            var vibeData = [ new Attention.VibeProfile(50, 250)];// On for 0.25 seconds
            Attention.vibrate(vibeData);
        }
    }

    public function startStopTimer() as Void {
        if (_timeRunning == false) {
            _timer1.start(method(:callback1), 1000, true);
            _timeRunning = true;
        } else {
            _timer1.stop();
            _timeRunning = false;
        }

    }
}