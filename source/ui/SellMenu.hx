package ui;

import flixel.addons.ui.FlxUIPopup;

class SellMenu extends FlxUIPopup {
	override public function create():Void
	{
		_xml_id = "sell";
		super.create();
		_ui.setMode("demo_0");
	}

	override public function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void
	{
		if (params != null && params.length > 0)
		{
			if (id == "click_button")
			{
				var i:Int = cast params[0];
				if (_ui.currMode == "demo_0")
				{
					switch (i)
					{
						case 0:
							close();
						case 1:
							close();
						
					}
				}
				
			}
		}
	}
}