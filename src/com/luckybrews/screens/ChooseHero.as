package com.luckybrews.screens
{
	import com.hsharma.hungryHero.customObjects.Font;
	import com.hsharma.hungryHero.events.NavigationEvent;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class ChooseHero extends Sprite
	{	
		/** Background image. */
		private var bg:Image;
		
		/** Title image for JAPA. */
		private var titleJapa:Image;
		
		/** Title image for APOLLO. */
		private var titleApollo:Image;
		
		/** Hero JAPA button. */
		private var heroJapaBtn:Button;
		
		/** Hero APOLLO button. */
		private var heroApolloBtn:Button;		
		
		/** Screen mode - "chooseHero" or "aboutJAPA" or "aboutApollo". */
		private var screenMode:String;
		
		/** Font - Regular text. */
		private var fontRegular:Font;
		
		/** JAPA stats text fields. */
		private var corpoJapaText:TextField;
		private var charmeJapaText:TextField;
		private var steccaJapaText:TextField;
		private var gustoJapaText:TextField;
		
		/** JAPA stats stars. */
		private var corpoJapaStars:Image;
		private var charmeJapaStars:Image;
		private var steccaJapaStars:Image;
		private var gustoJapaStars:Image;
		
		/** APOLLO stats text fields. */
		private var corpoApolloText:TextField;
		private var charmeApolloText:TextField;
		private var steccaApolloText:TextField;
		private var gustoApolloText:TextField;
		
		/** JAPA stats stars. */
		private var corpoApolloStars:Image;
		private var charmeApolloStars:Image;
		private var steccaApolloStars:Image;
		private var gustoApolloStars:Image;
		
		/** Hero art tweens object. */
		private var tween_hero_japa:Tween;
		private var tween_hero_apollo:Tween;
		private var tween_hero_japa2:Tween;
		private var tween_hero_apollo2:Tween;
		
		/** Current date. */
		private var _currentDate:Date;
		
		/** Current date. */
		private const HEROES_Y_PERCENT:Number = 0.15;
		
		public function ChooseHero()
		{
			super();
			this.visible = false;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			// -------------  CREATE  -------------
			
			// background
			bg = new Image(Assets.getTexture("BgWelcome"));
			bg.blendMode = BlendMode.NONE;
			// this.addChild(bg);	// FIXME: add real background
			
			// title JAPA
			titleJapa = new Image(Assets.getLuckyBrewsAtlas().getTexture("titleJAPA"));
			this.addChild(titleJapa);
			
			// title APOLLO
			titleApollo = new Image(Assets.getLuckyBrewsAtlas().getTexture("titleAPOLLO"));
			this.addChild(titleApollo);
			
			// hero JAPA
			heroJapaBtn = new Button(Assets.getLuckyBrewsAtlas().getTexture("prova_hero_sx"));	
			this.addChild(heroJapaBtn);
			
			// hero APOLLO
			heroApolloBtn = new Button(Assets.getLuckyBrewsAtlas().getTexture("prova_hero_dx"));
			this.addChild(heroApolloBtn);
			
			// -------------  POSITION  -------------
			
			var titleY  : uint = 0.05 * stage.stageHeight;
			var heroesY : uint = HEROES_Y_PERCENT * stage.stageHeight;
			
			var column1X: uint = 0.25 * stage.stageWidth;
			var column2X: uint = 0.75 * stage.stageWidth;
			
			// title JAPA
			titleJapa.y = titleY;
			titleJapa.x = column1X - titleJapa.width * 0.5;
			
			// title APOLLO
			titleApollo.y = titleY;
			titleApollo.x = column2X - titleApollo.width * 0.5;
			
			// OR text
			var orText:TextField = new TextField(150, 150, "", "AngryBirds", 60, Color.WHITE);
			orText.text = "VS";
			orText.x = (stage.stageWidth - orText.width) / 2;
			orText.y = 0.02 * stage.stageHeight;
			orText.hAlign = HAlign.CENTER;
			orText.vAlign = VAlign.CENTER;
			this.addChild(orText);
			
			// hero JAPA
			heroJapaBtn.y = heroesY;
			heroJapaBtn.x = column1X - heroJapaBtn.width * 0.5;
			
			// hero APOLLO
			heroApolloBtn.y = heroesY;
			heroApolloBtn.x = column2X - heroApolloBtn.width * 0.5;		
			
			// -------------  LISTENERS  -------------
			
			heroJapaBtn.addEventListener(Event.TRIGGERED, onJapaPlayClick);
			heroApolloBtn.addEventListener(Event.TRIGGERED, onApolloPlayClick);
			
			createSheets();
		}
		
		/**
		 * On play JAPA button click. 
		 * @param event
		 * 
		 */
		private function onJapaPlayClick(event:Event):void
		{
			onPlayClick(event); // FIXME: change character to JAPA
		}
		
		/**
		 * On play APOLLO button click. 
		 * @param event
		 * 
		 */
		private function onApolloPlayClick(event:Event):void
		{
			onPlayClick(event); // FIXME: change character to APOLLO
		}
		
		
		/**
		 * On play button click. 
		 * @param event
		 * 
		 */
		private function onPlayClick(event:Event):void
		{
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
			
			if (!Sounds.muted) Sounds.sndCoffee.play();
		}
		
		/**
		 * Dispose objects temporarily. 
		 * 
		 */
		public function disposeTemporarily():void
		{
			this.visible = false;
			
			// XXX if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, floatingAnimation);
			
			// XXX if (screenMode != "about") SoundMixer.stopAll();
		}
		
		/**
		 * Initialize chooseHero screen. 
		 * 
		 */
		public function initialize():void
		{
			disposeTemporarily();
			
			this.visible = true;
			
			// tween hero Japa
			heroJapaBtn.x = -heroJapaBtn.width;	
			//heroJapaBtn.y = 0.8 * stage.stageHeight;
			heroJapaBtn.alpha = 0;
			//tween_hero_japa = new Tween(heroJapaBtn, 1, Transitions.EASE_OUT);
			//tween_hero_japa.animate("x", stage.stageWidth/2 - heroJapaBtn.width);
			//tween_hero_japa.animate("x", 0.25 * stage.stageWidth - heroApolloBtn.width * 0.5);
			//Starling.juggler.add(tween_hero_japa);
			
			// tween hero Apollo
			heroApolloBtn.x = stage.stageWidth;	
			//heroApolloBtn.y = 0.8 * stage.stageHeight;
			heroApolloBtn.alpha = 0;
			//tween_hero_apollo = new Tween(heroApolloBtn, 1, Transitions.EASE_OUT);
			//tween_hero_apollo.animate("x", stage.stageWidth/2);
			//Starling.juggler.add(tween_hero_apollo);

			// after cheers tweens
			tween_hero_japa2 = new Tween(heroJapaBtn, 0.9, Transitions.EASE_OUT);
			tween_hero_japa2.animate("x", 0.25 * stage.stageWidth - heroJapaBtn.width * 0.5);
				
			tween_hero_apollo2 = new Tween(heroApolloBtn, 0.9, Transitions.EASE_OUT);
			tween_hero_apollo2.animate("x", 0.75 * stage.stageWidth - heroApolloBtn.width * 0.5);
			
			// cheers tweens
			Starling.juggler.tween(heroJapaBtn, 1.5, {
				transition: Transitions.EASE_IN,
				delay: 0,
				alpha: 1,
				repeatCount: 1,
				onComplete: showSheets,
				x: stage.stageWidth/2 - heroJapaBtn.width,
				y: HEROES_Y_PERCENT * stage.stageHeight,
				// rotation: deg2rad(90)
				nextTween : tween_hero_japa2
			});
			
			Starling.juggler.tween(heroApolloBtn, 1.5, {
				transition: Transitions.EASE_IN,
				delay: 0,
				alpha: 1,
				repeatCount: 1,
				//onComplete: function():void { startButton.enabled = true; },
				x: stage.stageWidth/2,
				y: HEROES_Y_PERCENT * stage.stageHeight,
				// rotation: deg2rad(90)
				nextTween : tween_hero_apollo2
			});
			
			tween_hero_apollo2 = new Tween(heroApolloBtn, 0.5, Transitions.EASE_OUT);
			tween_hero_apollo2.animate("x", 0.75 * stage.stageWidth - heroApolloBtn.width * 0.5);
			//Starling.juggler.add(tween_hero_apollo2);
			
			// floating heroes animation listener
			this.addEventListener(Event.ENTER_FRAME, floatingAnimation);
			
		}
		
		/**
		 * Animate floating objects. 
		 * @param event
		 * 
		 */
		private function floatingAnimation(event:Event):void
		{
			_currentDate = new Date();
			heroJapaBtn.y = HEROES_Y_PERCENT * stage.stageHeight + (Math.cos(_currentDate.getTime() * 0.002)) * 25;
			heroApolloBtn.y = HEROES_Y_PERCENT * stage.stageHeight + (Math.cos(_currentDate.getTime() * 0.002)) * 25;
			//playBtn.y = 340 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
			//aboutBtn.y = 460 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
		}
		
		/**
		 * Create heroes' sheets
		 */
		private function createSheets():void 
		{
			var textSize:uint = 40;
			var padding:uint = 10;
			
			// Corpo JAPA text
			corpoJapaText = new TextField(150, 100, "", "AngryBirds", textSize, Color.WHITE);
			corpoJapaText.text = "CORPO";
			corpoJapaText.x = 0.02 * stage.stageWidth;
			corpoJapaText.y = 0.65 * stage.stageHeight;
			corpoJapaText.hAlign = HAlign.LEFT;
			corpoJapaText.vAlign = VAlign.CENTER;
			corpoJapaText.height = corpoJapaText.textBounds.height + 30;
			corpoJapaText.visible = false;
			this.addChild(corpoJapaText);
			
			// Charme JAPA	
			charmeJapaText = new TextField(150, 100, "", "AngryBirds", textSize, Color.WHITE);
			charmeJapaText.text = "CHARME";
			charmeJapaText.x = corpoJapaText.x;
			charmeJapaText.y = corpoJapaText.y + corpoJapaText.textBounds.height + padding;
			charmeJapaText.hAlign = HAlign.LEFT;
			charmeJapaText.vAlign = VAlign.CENTER;
			charmeJapaText.height = corpoJapaText.textBounds.height + 30;
			charmeJapaText.visible = false;
			this.addChild(charmeJapaText);
			
			// Stecca JAPA	
			steccaJapaText = new TextField(150, 100, "", "AngryBirds", textSize, Color.WHITE);
			steccaJapaText.text = "STECCA";
			steccaJapaText.x = corpoJapaText.x;
			steccaJapaText.y = charmeJapaText.y + corpoJapaText.textBounds.height + padding;
			steccaJapaText.hAlign = HAlign.LEFT;
			steccaJapaText.vAlign = VAlign.CENTER;
			steccaJapaText.height = corpoJapaText.textBounds.height + 30;
			steccaJapaText.visible = false;
			this.addChild(steccaJapaText);
			
			// Gusto JAPA	
			gustoJapaText = new TextField(150, 100, "", "AngryBirds", textSize, Color.WHITE);
			gustoJapaText.text = "GUSTO";
			gustoJapaText.x = corpoJapaText.x;
			gustoJapaText.y = steccaJapaText.y + corpoJapaText.textBounds.height + padding;
			gustoJapaText.hAlign = HAlign.LEFT;
			gustoJapaText.vAlign = VAlign.CENTER;
			gustoJapaText.height = corpoJapaText.textBounds.height + 30;
			gustoJapaText.visible = false;
			this.addChild(gustoJapaText);
			
			// Corpo JAPA stars
			corpoJapaStars = new Image(Assets.getLuckyBrewsAtlas().getTexture("1stars"));
			corpoJapaStars.x = corpoJapaText.x + corpoJapaText.width;
			corpoJapaStars.y = corpoJapaText.y - 2;
			corpoJapaStars.visible = false;
			this.addChild(corpoJapaStars);
			
			// Charme JAPA stars
			charmeJapaStars = new Image(Assets.getLuckyBrewsAtlas().getTexture("4stars"));
			charmeJapaStars.x = charmeJapaText.x + charmeJapaText.width;
			charmeJapaStars.y = charmeJapaText.y + 5;
			charmeJapaStars.visible = false;
			this.addChild(charmeJapaStars);
			
			// Stecca JAPA stars
			steccaJapaStars = new Image(Assets.getLuckyBrewsAtlas().getTexture("2stars"));
			steccaJapaStars.x = steccaJapaText.x + steccaJapaText.width;
			steccaJapaStars.y = steccaJapaText.y + 5;
			steccaJapaStars.visible = false;
			this.addChild(steccaJapaStars);
			
			// Gusto JAPA stars
			gustoJapaStars = new Image(Assets.getLuckyBrewsAtlas().getTexture("5stars"));
			gustoJapaStars.x = gustoJapaText.x + gustoJapaText.width;
			gustoJapaStars.y = gustoJapaText.y + 5;
			gustoJapaStars.visible = false;
			this.addChild(gustoJapaStars);
			
			// -------------- APOLLO ---------------
			
			// Corpo APOLLO text
			corpoApolloText = new TextField(150, 100, "", "AngryBirds", textSize, Color.WHITE);
			corpoApolloText.text = "CORPO";
			corpoApolloText.x = 0.55 * stage.stageWidth;
			corpoApolloText.y = 0.65 * stage.stageHeight;
			corpoApolloText.hAlign = HAlign.LEFT;
			corpoApolloText.vAlign = VAlign.CENTER;
			corpoApolloText.height = corpoApolloText.textBounds.height + 30;
			corpoApolloText.visible = false;
			this.addChild(corpoApolloText);
			
			// Charme APOLLO text	
			charmeApolloText = new TextField(150, 100, "", "AngryBirds", textSize, Color.WHITE);
			charmeApolloText.text = "CHARME";
			charmeApolloText.x = corpoApolloText.x;
			charmeApolloText.y = corpoApolloText.y + corpoApolloText.textBounds.height + padding;
			charmeApolloText.hAlign = HAlign.LEFT;
			charmeApolloText.vAlign = VAlign.CENTER;
			charmeApolloText.height = corpoJapaText.textBounds.height + 30;
			charmeApolloText.visible = false;
			this.addChild(charmeApolloText);
			
			// Stecca APOLLO text
			steccaApolloText = new TextField(150, 100, "", "AngryBirds", textSize, Color.WHITE);
			steccaApolloText.text = "STECCA";
			steccaApolloText.x = corpoApolloText.x;
			steccaApolloText.y = charmeApolloText.y + corpoApolloText.textBounds.height + padding;
			steccaApolloText.hAlign = HAlign.LEFT;
			steccaApolloText.vAlign = VAlign.CENTER;
			steccaApolloText.height = corpoJapaText.textBounds.height + 30;
			steccaApolloText.visible = false;
			this.addChild(steccaApolloText);
			
			// Gusto APOLLO text	
			gustoApolloText = new TextField(150, 100, "", "AngryBirds", textSize, Color.WHITE);
			gustoApolloText.text = "GUSTO";
			gustoApolloText.x = corpoApolloText.x;
			gustoApolloText.y = steccaApolloText.y + corpoApolloText.textBounds.height + padding;
			gustoApolloText.hAlign = HAlign.LEFT;
			gustoApolloText.vAlign = VAlign.CENTER;
			gustoApolloText.height = corpoJapaText.textBounds.height + 30;
			gustoApolloText.visible = false;
			this.addChild(gustoApolloText);
			
			// Corpo JAPA stars
			corpoApolloStars = new Image(Assets.getLuckyBrewsAtlas().getTexture("3stars"));
			corpoApolloStars.x = corpoApolloText.x + corpoApolloText.width;
			corpoApolloStars.y = corpoJapaText.y + 5;
			corpoApolloStars.visible = false;
			this.addChild(corpoApolloStars);
			
			// Charme JAPA stars
			charmeApolloStars = new Image(Assets.getLuckyBrewsAtlas().getTexture("1stars"));
			charmeApolloStars.x = charmeApolloText.x + charmeApolloText.width;
			charmeApolloStars.y = charmeApolloText.y + 5;
			charmeApolloStars.visible = false;
			this.addChild(charmeApolloStars);
			
			// Stecca JAPA stars
			steccaApolloStars = new Image(Assets.getLuckyBrewsAtlas().getTexture("2stars"));
			steccaApolloStars.x = steccaApolloText.x + steccaApolloText.width;
			steccaApolloStars.y = steccaApolloText.y + 5;
			steccaApolloStars.visible = false;
			this.addChild(steccaApolloStars);
			
			// Gusto JAPA stars
			gustoApolloStars = new Image(Assets.getLuckyBrewsAtlas().getTexture("5stars"));
			gustoApolloStars.x = gustoApolloText.x + gustoApolloText.width;
			gustoApolloStars.y = gustoApolloText.y + 5;
			gustoApolloStars.visible = false;
			this.addChild(gustoApolloStars);
		}
		
	
		/**
		 * Create heroes' sheets
		 */
		private function showSheets():void 
		{
			corpoJapaText.visible = true;
			charmeJapaText.visible = true;
			steccaJapaText.visible = true;
			gustoJapaText.visible = true;
			
			corpoJapaStars.visible = true;
			charmeJapaStars.visible = true;
			steccaJapaStars.visible = true;
			gustoJapaStars.visible = true;
			
			corpoApolloText.visible = true;
			charmeApolloText.visible = true;
			steccaApolloText.visible = true;
			gustoApolloText.visible = true;
			
			corpoApolloStars.visible = true;
			charmeApolloStars.visible = true;
			steccaApolloStars.visible = true;
			gustoApolloStars.visible = true;
		}
	}
}