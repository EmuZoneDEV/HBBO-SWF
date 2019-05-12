﻿package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.utils.Dictionary;
    import com.sulake.room.object.IRoomObjectModel;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.visualization.data.DirectionalOffsetData;
    import com.sulake.room.utils.RoomGeometry;

    public class FurnitureRoomBackgroundVisualization extends FurnitureBrandedImageVisualization 
    {
        private var _imageOffsets:Dictionary;


        override public function dispose():void
        {
            super.dispose();
            this._imageOffsets = null;
        }

        override protected function getAdClickUrl(k:IRoomObjectModel):String
        {
            return null;
        }

        override protected function imageReady(k:BitmapData, _arg_2:String):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            super.imageReady(k, _arg_2);
            if (k != null)
            {
                this._imageOffsets = new Dictionary();
                _local_3 = 64;
                _local_4 = k.width;
                _local_5 = k.height;
                this._Str_19393(_local_3, _local_5, _local_4);
                _local_3 = 32;
                _local_4 = (_local_4 / 2);
                _local_5 = (_local_5 / 2);
                this._Str_19393(_local_3, _local_5, _local_4);
            }
        }

        private function _Str_19393(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int = _Str_3033(k);
            var _local_5:DirectionalOffsetData = new DirectionalOffsetData();
            _local_5._Str_9421(1, 0, -(_arg_2));
            _local_5._Str_9421(3, 0, 0);
            _local_5._Str_9421(5, -(_arg_3), 0);
            _local_5._Str_9421(7, -(_arg_3), -(_arg_2));
            _local_5._Str_9421(4, (-(_arg_3) / 2), (-(_arg_2) / 2));
            this._imageOffsets[_local_4] = _local_5;
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int;
            var _local_5:DirectionalOffsetData;
            if (this._imageOffsets != null)
            {
                _local_4 = _Str_3033(k);
                _local_5 = this._imageOffsets[_local_4];
                if (_local_5 != null)
                {
                    return _local_5._Str_19089(_arg_2, 0) + this._Str_13309(offsetX, k);
                }
            }
            return super.getSpriteXOffset(k, _arg_2, _arg_3) + this._Str_13309(offsetX, k);
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int;
            var _local_5:DirectionalOffsetData;
            if (this._imageOffsets != null)
            {
                _local_4 = _Str_3033(k);
                _local_5 = this._imageOffsets[_local_4];
                if (_local_5 != null)
                {
                    return _local_5._Str_21951(_arg_2, 0) + this._Str_13309(offsetY, k);
                }
            }
            return super.getSpriteYOffset(k, _arg_2, _arg_3) + this._Str_13309(offsetY, k);
        }

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number
        {
            return super.getSpriteZOffset(k, _arg_2, _arg_3) + (offsetZ * -1);
        }

        override protected function getSpriteMouseCapture(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            var _local_4:Boolean;
            return _local_4;
        }

        private function _Str_13309(k:int, _arg_2:int):Number
        {
            return (k * _arg_2) / RoomGeometry._Str_7213;
        }
    }
}
