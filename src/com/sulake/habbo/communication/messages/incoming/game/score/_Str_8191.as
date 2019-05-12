﻿package com.sulake.habbo.communication.messages.incoming.game.score
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser;

    public class _Str_8191 extends MessageEvent 
    {
        public function _Str_8191(k:Function)
        {
            super(k, Game2WeeklyLeaderboardParser);
        }

        public function _Str_2273():Game2WeeklyLeaderboardParser
        {
            return this._parser as Game2WeeklyLeaderboardParser;
        }
    }
}
