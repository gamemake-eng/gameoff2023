package;

import Global.*;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.ui.FlxBar;
import flixel.text.FlxText;
import flixel.FlxG;

class PlayState extends FlxState
{
	var buildButton:FlxButton;
	var sellButton:FlxButton;

	var buildBar:FlxBar;
	var brickText:FlxText;
	var cashText:FlxText;
	
	override public function create()
	{
		super.create();

		buildBar = new FlxBar();
		buildBar.screenCenter();
		buildBar.y += 20;

		buildButton = new FlxButton(0,0,"", buildBrick);
		buildButton.text = "Build brick";
		buildButton.screenCenter();
		//buildButton.y += 160;

		sellButton = new FlxButton(0,0,"", sellBrick);
		sellButton.text = "Sell bricks";
		sellButton.screenCenter();
		sellButton.y += 160;
		
		brickText = new FlxText();
		brickText.text = "0";
		brickText.size = 20;
		brickText.screenCenter();
		brickText.y -= 200;

		cashText = new FlxText();
		cashText.text = "$0";
		cashText.size = 10;
		cashText.screenCenter();
		cashText.y -= 350;


		add(buildButton);
		add(sellButton);
		add(buildBar);
		add(brickText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		brickText.text = Std.string(bricks);
		brickText.screenCenter();
		brickText.y -= 200;

		cashText.text = "$"+Std.string(money);
		cashText.screenCenter();
		cashText.y -= 350;

		buildBar.value = progress;

		
	}

	function buildBrick() {
		if (progress >= 100) {
			bricks += 1;
			progress = 0;
		}else {
			progress += 2;
		}
	}
	function sellBrick() {
		/*if (bricks >= 6) {
			money += 0.5 * bricks;
			bricks -= bricks;
		}*/
		openSubState(new ui.SellMenu());
	}
}
