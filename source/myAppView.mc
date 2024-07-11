import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.System;

class myAppView extends WatchUi.View {
    public var _scoreLight as Number = 0;
    public var _scoreDark as Number = 0;
    public var _scoreLightLabel;
    public var _scoreDarkLabel;  
    private var _elapsedSecondsGame as Number = 0;
    private var _elapsedSecondsPoint as Number = 0;
    var _myTime;
    var _gameTimeLabel;
    var _pointTimeLabel;
    var _clockLabel;
    var _ratioWomenPng;
    var _ratioMenPng;
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
        var timer1 = new Timer.Timer();
        timer1.start(method(:callback1), 1000, true);
        
        _gameTimeLabel = findDrawableById("id_gameTimer");
        _pointTimeLabel = findDrawableById("id_pointTimer");
        _clockLabel = findDrawableById("id_clock");
        _ratioWomenPng = findDrawableById("gender_women");
        _ratioMenPng = findDrawableById("gender_men");
        
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
        //_gameTimeLabel.setText(_elapsedSecondsGame.toString());
        _gameTimeLabel.setText(convertSecondsToTimerString(_elapsedSecondsGame));
        _pointTimeLabel.setText(convertSecondsToTimerString(_elapsedSecondsPoint));
        _myTime = System.getClockTime();
        _clockLabel.setText(_myTime.hour.format("%02d") + ":" +  _myTime.min.format("%02d"));
        //dc.drawText(180, 200, Graphics.FONT_MEDIUM, _scoreLight.toString(), Graphics.TEXT_JUSTIFY_CENTER);
        //dc.drawText(210, 200, Graphics.FONT_MEDIUM, _scoreDark.toString(), Graphics.TEXT_JUSTIFY_CENTER);
        //addScore();
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    public function addScore(team as Number) as Void {
        //reset point clock 
        // this might not be the best place as this method is only called when the user selects which team scored, not when button is pressed.
        _elapsedSecondsPoint=0;
        
        if (team == 1){
            _scoreLight++;
        } else {
            _scoreDark++;
        }
        calculateRatio();
    }

    public function calculateRatio() as Void{
        //add scores, calculate, and display which is the correct Gender Ratio
        // A = 0, B = 1
        var scoreSum = _scoreDark + _scoreLight;
        var scoreMod = scoreSum % 4;
        switch (scoreMod) {
            case 0:
                _ratioWomenPng.setVisible(true);
                _ratioMenPng.setVisible(false);
                break;
            case 1:
                _ratioWomenPng.setVisible(false);
                _ratioMenPng.setVisible(true);
                break;
            case 2:
                _ratioWomenPng.setVisible(false);
                _ratioMenPng.setVisible(true);
                break;
            case 3:
                _ratioWomenPng.setVisible(true);
                _ratioMenPng.setVisible(false);
                break;
        }
        

    }

    //! Callback for timer 1
    public function callback1() as Void {
        _elapsedSecondsGame++;
        _elapsedSecondsPoint++;
        WatchUi.requestUpdate();
    }

    function convertSecondsToTimerString(totalSeconds) {
        var hours = totalSeconds / 3600;
        var minutes = (totalSeconds /60) % 60;
        var seconds = totalSeconds % 60;
        var timeString = format("$1$:$2$:$3$", [hours.format("%02d"), minutes.format("%02d"), seconds.format("%02d")]);
        return timeString;
    }

}