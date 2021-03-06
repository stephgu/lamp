package
{
	import PlayState;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	
	public class Player extends FlxSprite
	{
		public var camTar:FlxObject;
		public var walk:FlxSound = FlxG.play(Sources.LampWalkSoundEffect, 0.25, true);
		public var beam:FlxSound = FlxG.play(Sources.LightBeamSoundEffect, 0.25, true);
		
		private var camY:int = 120;
		private var jumpHeight:int = -200;
		private var movespeed:int = 150;
		private var yVelocity:int = -300;
		
		
		public function Player():void
		{ 
			loadGraphic(Sources.ImgPlayer, true, true, 80, 80);
			
			//                        var lightbeam:FlxSprite;
			//                        lightbeam = new FlxSprite;
			//                        lightbeam.loadGraphic(Sources.ImgLightBeam, true, true, 80, 80); 
			//                        FlxG.state.add(lightbeam); 
			
			//set animations here
			addAnimation("idle"/*name of animation*/, [0]/*used frames*/);
			addAnimation("walk", [0, 1, 2, 3, 4, 5, 6, 7, 8], 10/*frames per second*/);
			addAnimation("jump", [2, 1, 0], 3/*frames per second*/);
			
			acceleration.y = 600; 
			camTar = new FlxObject;
			camTar.x = x;
			camTar.y = camY;
			
			
		}
		
		override public function update():void
		{
			movement();
			
			camTar.x = x;
			camTar.y = camY;
			
			
			super.update();
		}
		
		private function movement():void
		{
			velocity.x = 0; 
			var right:Boolean = ( FlxG.keys.RIGHT || FlxG.keys.D ); 
			var left:Boolean = (FlxG.keys.LEFT || FlxG.keys.A);
			var up:Boolean = (FlxG.keys.UP || FlxG.keys.W);
			
			if (FlxG.keys.E){
				beam.play();
			} else
			{
				beam.stop();
			}
			
			if (touching & DOWN)
			{
				if ((left || right) && !(FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W")))
				{
					play('walk');
					walk.play();
				} else if (FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W"))
				{
					var jump:FlxSound = FlxG.play(Sources.LampJumpSoundEffect, 0.25);
					velocity.y = yVelocity;
				}
				else {
					play('idle');
					walk.stop();
				}
			} else
			{
				play('jump');
			}
			
			if (right)
			{
				velocity.x = 75;
				facing = RIGHT; 
				if (x > FlxG.width - width) 
				{
					velocity.x = 0; 
				}
			} else if (left)
			{
				velocity.x = -75;
				facing = LEFT; 
				if (x < 0) 
				{
					velocity.x = 0; 
				}
			}
			
			super.update();
			
		}
	}
}