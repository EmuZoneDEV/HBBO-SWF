﻿package _Str_340
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera._Str_8676;

    public class _Str_5617 extends MessageEvent 
    {
        public function _Str_5617(k:Function)
        {
            super(k, _Str_8676);
        }

        public function _Str_2273():_Str_8676
        {
            return this._parser as _Str_8676;
        }
    }
}