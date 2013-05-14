/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package
{
	/**
	 * This class holds all the constant values used during game play.
	 * Modifying certain properties of this class could result in
	 * slightly varied behavior in the game, e.g., hero's lives or speed. 
	 * 
	 * @author hsharma
	 * 
	 */
	public class GameConstants
	{
		// Player's states - what is the player doing? -------------
		
		public static const GAME_STATE_IDLE:int = 0;
		public static const GAME_STATE_FLYING:int = 1;
		public static const GAME_STATE_OVER:int = 2;
		
		// Hero's graphic states - what is the position/animation of hero?
		
		public static const HERO_STATE_IDLE:int = 0;
		public static const HERO_STATE_FLYING:int = 1;
		public static const HERO_STATE_HIT:int = 2;
		public static const HERO_STATE_FALL:int = 3;
		
		// Food item types -----------------------------------------
		
		public static const ITEM_TYPE_1:int = 1;
		public static const ITEM_TYPE_2:int = 2;
		public static const ITEM_TYPE_3:int = 3;
		public static const ITEM_TYPE_4:int = 4;
		public static const ITEM_TYPE_5:int = 5;
		public static const ITEM_TYPE_6:int = 6;
		
		public static const NORMAL_ITEMS_NUM:int = 6;
		public static const SPECIAL_ITEMS_NUM:int = 3;
		
		/** Special Item - BEER. */
		public static const ITEM_TYPE_BEER:int = 7;
		
		/** Special Item - LOGO. */
		public static const ITEM_TYPE_LOGO:int = 8;

		/** Special Item - PELO45. */
		public static const ITEM_TYPE_PELO45:int = 9;
		
		// CHARCTER PARAMS -----------------------------------------
		
		/** Length in seconds of "Beer Effect" */
		public static const BEER_EFFECT_LENGTH:int = 5; // XXX: shouldn't be a constant, change based on character
		
		/** Length in seconds of "Logo Effect" */
		public static const LOGO_EFFECT_LENGTH:int = 5; // XXX: shouldn't be a constant, change based on character
		
		/** Length in seconds of "Pelo45 Effect" */
		public static const PELO45_EFFECT_LENGTH:int = 5; // XXX: shouldn't be a constant, change based on character
		
		// ITEM CHANCES --------------------------------------------
	
		/** Chance of "Special Item" */
		//public static const SPECIAL_ITEM_CHANCE:Number = 0.3;

		/** Chance of "Normal Item" */
		public static const NORMAL_ITEM_CHANCE:Number = 0.6;
		
		// Obstacle types ------------------------------------------
		
		/** Obstacle - Aeroplane. */
		public static const OBSTACLE_TYPE_1:int = 1;
		
		/** Obstacle - Space Ship. */		
		public static const OBSTACLE_TYPE_2:int = 2;
		
		/** Obstacle - Airship. */
		public static const OBSTACLE_TYPE_3:int = 3;
		
		/** Obstacle - Helicopter. */
		public static const OBSTACLE_TYPE_4:int = 4;
		
		// Particle types ------------------------------------------
		
		/** Particle - Sparkle. */		
		public static const PARTICLE_TYPE_1:int = 1;
		
		/** Particle - Wind Force. */		
		public static const PARTICLE_TYPE_2:int = 2;
		
		// Hero properties -----------------------------------------
		
		/** Hero's initial spare lives. */		
		public static const HERO_LIVES:int = 5;
		
		/** Hero's minimum speed. */
		public static const HERO_MIN_SPEED:Number = 650;
		
		/** Hero's maximum speed when had coffee. */		
		public static const HERO_MAX_SPEED:Number = 1400;
		
		/** Movement speed - game/player/items/obstacles speed. */
		public static const GRAVITY:Number = 10;
		
		// Obstacle properties -------------------------------------
		
		/** Obstacle frequency. */
		public static const OBSTACLE_GAP:Number = 1200;
		
		/** Obstacle speed. */		
		public static const OBSTACLE_SPEED:Number = 300;
	}
}