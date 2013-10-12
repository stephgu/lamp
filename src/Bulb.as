package {
	/**
	 * @author ethanis
	 */
	 import org.flixel.*;
	 
	public class Bulb extends FlxSprite {
		public var wasCollected:Boolean = false;
		private var offsetCount:int = 0;
		private var goingUp:Boolean = true;
		
		public function Bulb():void
		{
			loadGraphic(Sources.ImgBulb, false, true, 20, 20);
			//set animations here
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (offsetCount > 60){
				goingUp = !goingUp;
				offsetCount = 0;
			} else {
				offsetCount += 1;
			}
			this.y += goingUp ? -0.05 : 0.05;
		}
	}
}
