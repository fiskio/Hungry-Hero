package com.luckybrews.screens
{
	import com.hsharma.hungryHero.events.NavigationEvent;
	
	import flash.media.SoundMixer;
	
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
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
			
			var titleY  : uint = 0.1 * stage.stageHeight;
			var heroesY : uint = 0.3 * stage.stageHeight;
			
			var column1X: uint = 0.25 * stage.stageWidth;
			var column2X: uint = 0.75 * stage.stageWidth;
			
			// title JAPA
			titleJapa.y = titleY;
			titleJapa.x = column1X - titleJapa.width * 0.5;
			
			// title APOLLO
			titleApollo.y = titleY;
			titleApollo.x = column2X - titleApollo.width * 0.5;
			
			// hero JAPA
			heroJapaBtn.y = heroesY;
			heroJapaBtn.x = column1X - heroJapaBtn.width * 0.5;
			
			// hero APOLLO
			heroApolloBtn.y = heroesY;
			heroApolloBtn.x = column2X - heroApolloBtn.width * 0.5;		
			
			// -------------  LISTENERS  -------------
			
			heroJapaBtn.addEventListener(Event.TRIGGERED, onJapaPlayClick);
			heroApolloBtn.addEventListener(Event.TRIGGERED, onApolloPlayClick);
			

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
		
		public function initialize():void
		{
			disposeTemporarily();
			
			this.visible = true;
			
		}
		
		
	}
}