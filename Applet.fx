import javafx.ui.*;
import javafx.ui.canvas.*;
import java.lang.Math;
import java.lang.System;

public class BindToFunctionApplet1 extends Applet {
  public function start(): Void {
    System.out.println("BindToFunctionApplet1.start()");
  }
  public function stop(): Void {
    System.out.println("BindToFunctionApplet1.stop()");
  }
}

class CircleModel {
  attribute diameter:Number;
  
  function getArea():Number {
    Math.PI * Math.pow(diameter / 2, 2);
  }
}

BorderPanel {
  var cModel = CircleModel {}
  background: Color.WHITE
  center:
    Canvas {
      content: [
        Circle {
          cx: 240
          cy: 250
          radius: bind cModel.diameter * 2
          stroke: Color.PURPLE
          strokeWidth: 1
          fill: Color.CYAN
        },
        Text {
          font: 
            Font {
              face: FontFace.SANSSERIF
              style: FontStyle.BOLD
              size: 24
            }
          x: 20
          y: 10
          stroke: Color.RED
          fill: Color.RED
          content: bind "Diameter: {cModel.diameter}"
        },
        Text {
          font: 
            Font {
              face: FontFace.SANSSERIF
              style: FontStyle.BOLD
              size: 24
            }
          x: 240
          y: 10
          stroke: Color.RED
          fill: Color.RED
          content: bind "Area: {%3.2f cModel.getArea()}"
        }
      ]
    }
  bottom:
    Slider {
      min: 0
      max: 100
      border: 
        TitledBorder {
          title: "Diameter:"
        }
      value: bind cModel.diameter with inverse
      minorTickSpacing: 5
      majorTickSpacing: 10
      paintTicks: true
      paintLabels: true
      labels: [
        SliderLabel {
          value: 0
          label: 
            SimpleLabel {
              text: "0"
            }
        },
        SliderLabel {
          value: 50
          label: 
            SimpleLabel {
              text: "50"
            }
        },
        SliderLabel {
          value: 100
          label: 
            SimpleLabel {
              text: "100"
            }
        }
      ]
    }
} 
