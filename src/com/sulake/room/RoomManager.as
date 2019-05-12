﻿package com.sulake.room
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.utils.Map;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import com.sulake.room.events.RoomContentLoadedEvent;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDRoomObjectFactory;
    import com.sulake.iid.IIDRoomObjectVisualizationFactory;
    import __AS3__.vec.Vector;
    import com.sulake.room.exceptions.RoomManagerException;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import flash.utils.getTimer;
    import com.sulake.iid.*;

    public class RoomManager extends Component implements IRoomManager, IRoomInstanceContainer 
    {
        public static const _Str_9994:int = -1;
        public static const _Str_16337:int = 0;
        public static const _Str_16443:int = 1;
        public static const _Str_13904:int = 2;
        public static const _Str_9846:int = 3;
        private static const _Str_18280:int = 40;

        private var _rooms:Map;
        private var _contentLoader:IRoomContentLoader;
        private var _initialLoadList:Array;
        private var _updateCategories:Array;
        private var _updateInterval:int;
        private var _listener:IRoomManagerListener;
        private var _objectFactory:IRoomObjectFactory = null;
        private var _visualizationFactory:IRoomObjectVisualizationFactory = null;
        private var _state:int = 0;
        private var _initializationData:XML = null;
        private var _unprocessedLoadedContentTypes:Array;
        private var _skipContentProcessingForNextFrame:Boolean = false;
        private var _limitContentProcessing:Boolean = true;
        private var _disposed:Boolean = false;

        public function RoomManager(k:IContext, _arg_2:uint=0)
        {
            this._unprocessedLoadedContentTypes = [];
            super(k, _arg_2);
            this._rooms = new Map();
            this._initialLoadList = [];
            this._updateCategories = [];
            events.addEventListener(RoomContentLoadedEvent.RCLE_SUCCESS, this._Str_9536);
            events.addEventListener(RoomContentLoadedEvent.RCLE_FAILURE, this._Str_9536);
            events.addEventListener(RoomContentLoadedEvent.RCLE_CANCEL, this._Str_9536);
        }

        override public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set _Str_26038(k:Boolean):void
        {
            this._limitContentProcessing = k;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDRoomObjectFactory(), function (k:IRoomObjectFactory):void
            {
                _objectFactory = k;
            }), new ComponentDependency(new IIDRoomObjectVisualizationFactory(), function (k:IRoomObjectVisualizationFactory):void
            {
                _visualizationFactory = k;
            })]));
        }

        override protected function initComponent():void
        {
            var k:XML;
            this._state = _Str_16443;
            if (this._initializationData != null)
            {
                k = this._initializationData;
                this._initializationData = null;
                this.initialize(k, this._listener);
            }
        }

        override public function dispose():void
        {
            var k:IRoomInstance;
            if (this.disposed)
            {
                return;
            }
            if (this._rooms != null)
            {
                for each (k in this._rooms)
                {
                    if (k != null)
                    {
                        k.dispose();
                    }
                }
                this._rooms.dispose();
                this._rooms = null;
            }
            this._listener = null;
            this._initialLoadList = null;
            this._updateCategories = null;
            this._contentLoader = null;
            super.dispose();
        }

        public function initialize(k:XML, _arg_2:IRoomManagerListener):Boolean
        {
            var _local_5:String;
            if (this._state == _Str_16337)
            {
                if (this._initializationData != null)
                {
                    return false;
                }
                this._initializationData = k;
                this._listener = _arg_2;
                return true;
            }
            if (this._state >= _Str_13904)
            {
                return false;
            }
            if (k == null)
            {
                return false;
            }
            if (this._contentLoader == null)
            {
                return false;
            }
            this._updateInterval = 50;
            this._listener = _arg_2;
            var _local_3:Array = this._contentLoader._Str_14258();
            var _local_4:int;
            while (_local_4 < _local_3.length)
            {
                _local_5 = _local_3[_local_4];
                if (this._initialLoadList.indexOf(_local_5) < 0)
                {
                    this._contentLoader._Str_16108(_local_5, events);
                    this._initialLoadList.push(_local_5);
                }
                _local_4++;
            }
            this._state = _Str_13904;
            return true;
        }

        public function _Str_22189(k:IRoomContentLoader):void
        {
            if (this._contentLoader != null)
            {
                this._contentLoader.dispose();
            }
            this._contentLoader = k;
        }

        public function _Str_4608(k:int):void
        {
            var _local_4:RoomInstance;
            var _local_2:int = this._updateCategories.indexOf(k);
            if (_local_2 >= 0)
            {
                return;
            }
            this._updateCategories.push(k);
            var _local_3:int = (this._rooms.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = (this._rooms.getWithIndex(_local_3) as RoomInstance);
                if (_local_4 != null)
                {
                    _local_4._Str_4608(k);
                }
                _local_3--;
            }
        }

        public function _Str_9123(k:int):void
        {
            var _local_4:RoomInstance;
            var _local_2:int = this._updateCategories.indexOf(k);
            if (_local_2 < 0)
            {
                return;
            }
            this._updateCategories.splice(_local_2, 1);
            var _local_3:int = (this._rooms.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = (this._rooms.getWithIndex(_local_3) as RoomInstance);
                if (_local_4 != null)
                {
                    _local_4._Str_9123(k);
                }
                _local_3--;
            }
        }

        public function _Str_5942(k:String, _arg_2:XML):IRoomInstance
        {
            var _local_5:int;
            if (this._state < _Str_9846)
            {
                throw (new RoomManagerException());
            }
            if (this._rooms.getValue(k) != null)
            {
                return null;
            }
            var _local_3:RoomInstance = new RoomInstance(k, this);
            this._rooms.add(String(k), _local_3);
            var _local_4:int = (this._updateCategories.length - 1);
            while (_local_4 >= 0)
            {
                _local_5 = this._updateCategories[_local_4];
                _local_3._Str_4608(_local_5);
                _local_4--;
            }
            return _local_3;
        }

        public function _Str_2881(k:String):IRoomInstance
        {
            return this._rooms.getValue(k) as IRoomInstance;
        }

        public function _Str_19091(k:int):IRoomInstance
        {
            return this._rooms.getWithIndex(k);
        }

        public function _Str_20300():int
        {
            return this._rooms.length;
        }

        public function _Str_7482(k:String):Boolean
        {
            var _local_2:IRoomInstance = (this._rooms.remove(k) as IRoomInstance);
            if (_local_2 != null)
            {
                _local_2.dispose();
                return true;
            }
            return false;
        }

        public function _Str_5865(k:String, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObject
        {
            if (this._state < _Str_9846)
            {
                throw (new RoomManagerException());
            }
            var _local_5:IRoomInstance = this._Str_2881(k);
            if (_local_5 == null)
            {
                return null;
            }
            if (this._contentLoader == null)
            {
                return null;
            }
            var _local_6:RoomInstance = (_local_5 as RoomInstance);
            if (_local_6 == null)
            {
                return null;
            }
            var _local_7:IGraphicAssetCollection;
            var _local_8:XML;
            var _local_9:XML;
            var _local_10:String;
            var _local_11:String;
            var _local_12:String = _arg_3;
            var _local_13:Boolean;
            if (!this._contentLoader._Str_22212(_arg_3))
            {
                _local_7 = this._contentLoader._Str_5052(_arg_3);
                if (_local_7 == null)
                {
                    _local_13 = true;
                    this._contentLoader._Str_16108(_arg_3, events);
                    _local_12 = this._contentLoader._Str_20150(_arg_3);
                    _local_7 = this._contentLoader._Str_5052(_local_12);
                }
                _local_8 = this._contentLoader._Str_14929(_local_12);
                _local_9 = this._contentLoader._Str_16500(_local_12);
                if (((_local_8 == null) || (_local_7 == null)))
                {
                    return null;
                }
                _local_10 = this._contentLoader._Str_10580(_local_12);
                _local_11 = this._contentLoader._Str_17270(_local_12);
            }
            else
            {
                _local_10 = _arg_3;
                _local_11 = _arg_3;
            }
            var _local_14:int = 1;
            var _local_15:IRoomObject = _local_6._Str_23937(_arg_2, _local_14, _arg_3, _arg_4);
            var _local_16:IRoomObjectController = (_local_15 as IRoomObjectController);
            if (_local_16 == null)
            {
                return null;
            }
            var _local_17:IRoomObjectGraphicVisualization = this._visualizationFactory._Str_17646(_local_10);
            if (_local_17 == null)
            {
                _local_5._Str_3915(_arg_2, _arg_4);
                return null;
            }
            _local_17._Str_2697 = _local_7;
            _local_17.setExternalBaseUrls(context.configuration.getProperty("stories.image_url_base"), context.configuration.getProperty("extra_data_service_url"), context.configuration.getBoolean("extra_data_batches_enabled"));
            var _local_18:IRoomObjectVisualizationData;
            _local_18 = this._visualizationFactory._Str_16399(_local_12, _local_10, _local_8);
            if (!_local_17.initialize(_local_18))
            {
                _local_5._Str_3915(_arg_2, _arg_4);
                return null;
            }
            _local_16._Str_14063(_local_17);
            var _local_19:IRoomObjectEventHandler = this._objectFactory._Str_16699(_local_11);
            _local_16._Str_8711(_local_19);
            if (((!(_local_19 == null)) && (!(_local_9 == null))))
            {
                _local_19.initialize(_local_9);
            }
            if (!_local_13)
            {
                _local_16._Str_17972(true);
            }
            this._contentLoader._Str_19903(_local_16, k);
            return _local_16;
        }

        public function _Str_9811():IRoomObjectManager
        {
            if (this._objectFactory != null)
            {
                return this._objectFactory._Str_9811();
            }
            return null;
        }

        public function _Str_19453(k:String):Boolean
        {
            if (this._contentLoader != null)
            {
                if (this._contentLoader._Str_5052(k) != null)
                {
                    return true;
                }
            }
            return false;
        }

        private function _Str_23673(k:String):void
        {
            var _local_2:int;
            if (k == null)
            {
                return;
            }
            if (this._state == _Str_9994)
            {
                return;
            }
            if (this._contentLoader == null)
            {
                this._state = _Str_9994;
                return;
            }
            if (this._contentLoader._Str_5052(k) != null)
            {
                _local_2 = this._initialLoadList.indexOf(k);
                if (_local_2 >= 0)
                {
                    this._initialLoadList.splice(_local_2, 1);
                }
                if (this._initialLoadList.length == 0)
                {
                    this._state = _Str_9846;
                    if (this._listener != null)
                    {
                        this._listener._Str_18483(true);
                    }
                }
            }
            else
            {
                this._state = _Str_9994;
                this._listener._Str_18483(false);
            }
        }

        private function _Str_9536(k:RoomContentLoadedEvent):void
        {
            if (this._contentLoader == null)
            {
                return;
            }
            var _local_2:String = k.contentType;
            if (_local_2 == null)
            {
                if (this._listener != null)
                {
                    this._listener._Str_11314(null, false);
                }
                return;
            }
            if (this._unprocessedLoadedContentTypes.indexOf(_local_2) < 0)
            {
                this._unprocessedLoadedContentTypes.push(_local_2);
            }
        }

        private function _Str_24856():void
        {
            var _local_2:String;
            var _local_3:IGraphicAssetCollection;
            var _local_4:int;
            if (this._skipContentProcessingForNextFrame)
            {
                this._skipContentProcessingForNextFrame = false;
                return;
            }
            var k:int = getTimer();
            while (this._unprocessedLoadedContentTypes.length > 0)
            {
                _local_2 = this._unprocessedLoadedContentTypes[0];
                this._unprocessedLoadedContentTypes.splice(0, 1);
                if (!this._contentLoader._Str_21673(_local_2))
                {
                    if (this._listener != null)
                    {
                        this._listener._Str_11314(_local_2, false);
                    }
                    return;
                }
                _local_3 = this._contentLoader._Str_5052(_local_2);
                if (_local_3 == null)
                {
                    if (this._listener != null)
                    {
                        this._listener._Str_11314(_local_2, false);
                    }
                    return;
                }
                this._Str_24592(_local_2);
                if (this._listener != null)
                {
                    this._listener._Str_11314(_local_2, true);
                }
                if (this._initialLoadList.length > 0)
                {
                    this._Str_23673(_local_2);
                }
                _local_4 = getTimer();
                if ((((_local_4 - k) >= _Str_18280) && (this._limitContentProcessing)))
                {
                    this._skipContentProcessingForNextFrame = true;
                    return;
                }
            }
        }

        private function _Str_24592(k:String):void
        {
            var _local_2:XML;
            var _local_3:XML;
            var _local_4:IGraphicAssetCollection;
            var _local_7:IRoomObjectVisualizationData;
            var _local_9:RoomInstance;
            var _local_10:String;
            var _local_11:Array;
            var _local_12:Boolean;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:IRoomObjectController;
            var _local_17:IRoomObjectGraphicVisualization;
            var _local_18:IRoomObjectEventHandler;
            if (k == null)
            {
                return;
            }
            if (((this._contentLoader == null) || (this._visualizationFactory == null)))
            {
                return;
            }
            var _local_5:String = this._contentLoader._Str_10580(k);
            var _local_6:String = this._contentLoader._Str_17270(k);
            var _local_8:int = (this._rooms.length - 1);
            while (_local_8 >= 0)
            {
                _local_9 = (this._rooms.getWithIndex(_local_8) as RoomInstance);
                _local_10 = this._rooms.getKey(_local_8);
                if (_local_9 != null)
                {
                    _local_11 = _local_9._Str_20640();
                    _local_12 = false;
                    for each (_local_13 in _local_11)
                    {
                        _local_14 = _local_9._Str_9675(k, _local_13);
                        _local_15 = (_local_14 - 1);
                        while (_local_15 >= 0)
                        {
                            _local_16 = (_local_9._Str_11503(_local_15, k, _local_13) as IRoomObjectController);
                            if (_local_16 != null)
                            {
                                if (!_local_7)
                                {
                                    _local_2 = this._contentLoader._Str_14929(k);
                                    if (_local_2 == null)
                                    {
                                        return;
                                    }
                                    _local_3 = this._contentLoader._Str_16500(k);
                                    _local_4 = this._contentLoader._Str_5052(k);
                                    if (_local_4 == null)
                                    {
                                        return;
                                    }
                                    _local_7 = this._visualizationFactory._Str_16399(k, _local_5, _local_2);
                                }
                                _local_17 = this._visualizationFactory._Str_17646(_local_5);
                                if (_local_17 != null)
                                {
                                    _local_17._Str_2697 = _local_4;
                                    _local_17.setExternalBaseUrls(context.configuration.getProperty("stories.image_url_base"), context.configuration.getProperty("extra_data_service_url"), context.configuration.getBoolean("extra_data_batches_enabled"));
                                    if (!_local_17.initialize(_local_7))
                                    {
                                        _local_9._Str_3915(_local_16.getId(), _local_13);
                                    }
                                    else
                                    {
                                        _local_16._Str_14063(_local_17);
                                        _local_18 = this._objectFactory._Str_16699(_local_6);
                                        _local_16._Str_8711(_local_18);
                                        if (_local_18 != null)
                                        {
                                            _local_18.initialize(_local_3);
                                        }
                                        _local_16._Str_17972(true);
                                        if (this._listener != null)
                                        {
                                            this._listener._Str_19486(_local_10, _local_16.getId(), _local_13);
                                            _local_12 = true;
                                        }
                                    }
                                }
                                else
                                {
                                    _local_9._Str_3915(_local_16.getId(), _local_13);
                                }
                            }
                            _local_15--;
                        }
                    }
                    if (((!(_local_9._Str_21086())) && (_local_12)))
                    {
                        this._listener._Str_17652(_local_10);
                    }
                }
                _local_8--;
            }
        }

        public function update(k:uint):void
        {
            var _local_3:RoomInstance;
            this._Str_24856();
            var _local_2:int = (this._rooms.length - 1);
            while (_local_2 >= 0)
            {
                _local_3 = (this._rooms.getWithIndex(_local_2) as RoomInstance);
                if (_local_3 != null)
                {
                    _local_3.update();
                }
                _local_2--;
            }
        }
    }
}






