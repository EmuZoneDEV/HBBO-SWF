﻿package com.sulake.habbo.session
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import flash.utils.Dictionary;
    import com.sulake.habbo.session.product.ProductDataParser;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.furniture.FurnitureDataParser;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import flash.utils.Timer;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import flash.events.Event;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5264;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar._Str_5010;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3084;
    import com.sulake.habbo.communication.messages.incoming.users._Str_4150;
    import com.sulake.habbo.communication.messages.incoming.avatar.ChangeNameUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.availability._Str_9281;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetScratchFailedEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3407;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_6160;
    import com.sulake.habbo.communication.messages.incoming._Str_408._Str_9310;
    import com.sulake.habbo.communication.messages.incoming.users._Str_8527;
    import com.sulake.habbo.communication.messages.incoming.handshake.NoobnessLevelMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_8667;
    import com.sulake.habbo.communication.messages.incoming._Str_470._Str_3870;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5948;
    import com.sulake.habbo.session.furniture.IFurniDataListener;
    import com.sulake.habbo.communication.enum._Str_10354;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_4139;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.parser.users._Str_5856;
    import com.sulake.habbo.session.events.UserNameUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.avatar._Str_6553;
    import com.sulake.habbo.communication.messages.parser.mysterybox._Str_7765;
    import com.sulake.habbo.session.events.MysteryBoxKeysUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionUserTagsEvent;
    import _Str_505._Str_5515;
    import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_6831;
    import com.sulake.habbo.communication.messages.parser.availability._Str_7162;
    import com.sulake.habbo.communication.messages.parser.users._Str_5768;
    import com.sulake.habbo.communication.messages.outgoing._Str_370._Str_9930;
    import flash.display.BitmapData;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10714;
    import com.sulake.habbo.communication.messages.outgoing._Str_381._Str_8184;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_5199;
    import com.sulake.habbo.communication.messages.outgoing.room.chat._Str_7738;
    import flash.events.TimerEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.session.talent.TalentEnum;
    import __AS3__.vec.*;
    import com.sulake.iid.*;

    public class SessionDataManager extends Component implements ISessionDataManager 
    {
        public static const _Str_4161:uint = 1;

        private var _communicationManager:IHabboCommunicationManager;
        private var _windowManager:IHabboWindowManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _Str_6715:PerkManager;
        private var _userId:int;
        private var _name:String;
        private var _figure:String;
        private var _gender:String;
        private var _realName:String;
        private var _Str_7278:int = 0;
        private var _Str_3437:int = 0;
        private var _Str_3973:int = 0;
        private var _Str_7394:Boolean = true;
        private var _Str_25790:Array;
        private var _Str_20692:Boolean;
        private var _Str_20046:Boolean;
        private var _Str_8842:Boolean;
        private var _Str_2804:Dictionary;
        private var _Str_5571:ProductDataParser;
        private var _Str_3789:Map;
        private var _Str_3347:Map;
        private var _Str_5556:Map;
        private var _Str_4798:FurnitureDataParser;
        private var _Str_7432:_Str_8883;
        private var _Str_4822:BadgeImageManager;
        private var _Str_21127:HabboGroupInfoManager;
        private var _Str_11263:IgnoredUsersManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _Str_7186:Boolean = false;
        private var _Str_8233:Array;
        private var _Str_6042:Array;
        private var _clubLevel:int;
        private var _Str_8385:int;
        private var _Str_16966:int = 0;
        private var _Str_7106:int = -1;
        private var _Str_4890:Boolean;
        private var _Str_20255:Boolean;
        private var _Str_17475:Boolean;
        private var _Str_3790:int;
        private var _Str_9602:Boolean = false;
        private var _Str_18582:String;
        private var _Str_18348:String;
        private var _Str_20020:Boolean = false;
        private var _Str_12845:Boolean = false;
        private var _Str_8108:Timer = null;
        private var _Str_8546:String = null;

        public function SessionDataManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }, false), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }, ((flags & _Str_4161) == 0)), new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
                "type":Event.COMPLETE,
                "callback":this.onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }, false)]));
        }

        private function onConfigurationComplete(k:Event):void
        {
            this._Str_2804 = new Dictionary();
            this._Str_3789 = new Map();
            this._Str_3347 = new Map();
            this._Str_5556 = new Map();
            this._Str_9650();
            this._Str_24520();
            this._Str_23799();
        }

        override protected function initComponent():void
        {
            if (this._communicationManager)
            {
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_5264(this._Str_12366));
                this._communicationManager.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this._Str_4297));
                this._communicationManager.addHabboConnectionMessageEvent(new UserObjectEvent(this._Str_3241));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_5010(this._Str_8471));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_3084(this._Str_5174));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_4150(this._Str_10148));
                this._communicationManager.addHabboConnectionMessageEvent(new ChangeNameUpdateEvent(this._Str_18227));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_9281(this._Str_23236));
                this._communicationManager.addHabboConnectionMessageEvent(new PetScratchFailedEvent(this._Str_18116));
                this._communicationManager.addHabboConnectionMessageEvent((new _Str_3407(this._Str_5963) as IMessageEvent));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_6160(this._Str_18012));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_9310(this._Str_23478));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_8527(this._Str_7983));
                this._communicationManager.addHabboConnectionMessageEvent(new NoobnessLevelMessageEvent(this._Str_25667));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_8667(this._Str_25064));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_3870(this._Str_10366));
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_5948(this._Str_16302));
            }
            this._Str_25790 = [];
            this._Str_7432 = new _Str_8883(this);
            this._Str_21127 = new HabboGroupInfoManager(this);
            this._Str_11263 = new IgnoredUsersManager(this);
            this._Str_6715 = new PerkManager(this);
            this._Str_8233 = [];
            this._Str_6042 = [];
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._Str_7432 != null)
            {
                this._Str_7432.dispose();
                this._Str_7432 = null;
            }
            if (this._Str_3789)
            {
                this._Str_3789.dispose();
                this._Str_3789 = null;
            }
            if (this._Str_5556)
            {
                this._Str_5556.dispose();
                this._Str_5556 = null;
            }
            if (this._Str_6715)
            {
                this._Str_6715.dispose();
                this._Str_6715 = null;
            }
            this._Str_6042 = null;
            if (this._Str_4798)
            {
                this._Str_4798.removeEventListener(FurnitureDataParser.FDP_FURNITURE_DATA_READY, this._Str_17783);
                this._Str_4798.dispose();
                this._Str_4798 = null;
            }
            if (this._Str_5571)
            {
                this._Str_5571.removeEventListener(ProductDataParser.PDP_PRODUCT_DATA_READY, this._Str_18413);
                this._Str_5571.dispose();
                this._Str_5571 = null;
            }
            super.dispose();
        }

        private function _Str_23799():void
        {
            if (this._Str_4822 != null)
            {
                return;
            }
            this._Str_4822 = new BadgeImageManager(assets, events, this);
        }

        private function _Str_9650():void
        {
            var k:String;
            var _local_2:int;
            var _local_3:String;
            if (this._Str_4798)
            {
                this._Str_4798.dispose();
                this._Str_4798 = null;
            }
            this._Str_4798 = new FurnitureDataParser(this._Str_3789, this._Str_3347, this._Str_5556, this._localizationManager);
            this._Str_4798.addEventListener(FurnitureDataParser.FDP_FURNITURE_DATA_READY, this._Str_17783);
            if (propertyExists("furnidata.load.url"))
            {
                k = getProperty("furnidata.load.url");
                if (this._Str_8546 != null)
                {
                    _local_2 = k.lastIndexOf("/");
                    _local_3 = k.substring(0, _local_2);
                    this._Str_4798._Str_12194(((_local_3 + "/") + this._Str_8546));
                }
                else
                {
                    this._Str_4798._Str_12194(k);
                }
            }
        }

        private function _Str_24520():void
        {
            if (this._Str_5571)
            {
                this._Str_5571.dispose();
                this._Str_5571 = null;
            }
            var k:String = getProperty("productdata.load.url");
            this._Str_5571 = new ProductDataParser(k, this._Str_2804);
            this._Str_5571.addEventListener(ProductDataParser.PDP_PRODUCT_DATA_READY, this._Str_18413);
        }

        private function _Str_17783(k:Event=null):void
        {
            var _local_2:IFurniDataListener;
            this._Str_4798.removeEventListener(FurnitureDataParser.FDP_FURNITURE_DATA_READY, this._Str_17783);
            this._Str_20020 = true;
            if (((this._Str_11656) && (!(this._Str_12845))))
            {
                this._Str_12845 = true;
                for each (_local_2 in this._Str_6042)
                {
                    _local_2._Str_15145();
                }
            }
        }

        private function _Str_4297(k:IMessageEvent):void
        {
            var _local_2:UserRightsMessageEvent = UserRightsMessageEvent(k);
            this._clubLevel = _local_2.clubLevel;
            this._Str_8385 = _local_2._Str_6124;
            this._Str_16966 = Math.max(this._Str_16966, _local_2._Str_6124);
            this._Str_4890 = _local_2._Str_4050;
        }

        private function _Str_25667(k:NoobnessLevelMessageEvent):void
        {
            this._Str_7106 = k._Str_17519;
            if (this._Str_7106 != _Str_10354._Str_13601)
            {
                context.configuration.setProperty("new.identity", "1");
            }
        }

        private function _Str_3241(k:IMessageEvent):void
        {
            var _local_2:UserObjectEvent = (k as UserObjectEvent);
            var _local_3:_Str_4139 = _local_2._Str_2273();
            this._userId = _local_3.id;
            this._name = _local_3.name;
            this._Str_7278 = _local_3._Str_10295;
            this._Str_3437 = _local_3._Str_3577;
            this._Str_3973 = _local_3._Str_2985;
            this._figure = _local_3.figure;
            this._gender = _local_3._Str_3344;
            this._realName = _local_3.realName;
            this._Str_7394 = _local_3._Str_11198;
            this._Str_9602 = _local_3._Str_21338;
            this._Str_11263._Str_25475();
        }

        private function _Str_5174(k:IMessageEvent):void
        {
            var _local_2:_Str_3084 = (k as _Str_3084);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.id == -1)
            {
                this._figure = _local_2.figure;
                this._gender = _local_2._Str_3344;
            }
        }

        private function _Str_8471(k:IMessageEvent):void
        {
            var _local_2:_Str_5010 = (k as _Str_5010);
            if (_local_2 == null)
            {
                return;
            }
            this._figure = _local_2.figure;
            this._gender = _local_2.gender;
            HabboWebTools.updateFigure(this._figure);
        }

        private function _Str_10148(k:IMessageEvent):void
        {
            var _local_2:_Str_4150 = (k as _Str_4150);
            if (((_local_2 == null) || (_local_2._Str_2273() == null)))
            {
                return;
            }
            var _local_3:_Str_5856 = _local_2._Str_2273();
            if (_local_3._Str_5277 == this._userId)
            {
                this._name = _local_3._Str_16428;
                this._Str_7394 = false;
                events.dispatchEvent(new UserNameUpdateEvent(this._name));
            }
        }

        private function _Str_18227(k:ChangeNameUpdateEvent):void
        {
            var _local_2:_Str_6553 = k._Str_2273();
            if (_local_2._Str_3278 == ChangeNameUpdateEvent._Str_5797)
            {
                this._Str_7394 = false;
                events.dispatchEvent(new UserNameUpdateEvent(_local_2.name));
            }
        }

        private function _Str_23478(k:_Str_9310):void
        {
            var _local_2:_Str_7765 = k._Str_2273();
            this._Str_18582 = _local_2._Str_18286;
            this._Str_18348 = _local_2._Str_17811;
            events.dispatchEvent(new MysteryBoxKeysUpdateEvent(this._Str_18582, this._Str_18348));
        }

        private function _Str_7983(k:_Str_8527):void
        {
            if (this._Str_7432)
            {
                this._Str_7432._Str_25163(k.userId, k.tags);
            }
            events.dispatchEvent(new RoomSessionUserTagsEvent(this.userId, k.tags.slice()));
        }

        private function _Str_25064(k:_Str_8667):void
        {
            context.createLinkEvent(k.link);
        }

        private function _Str_10366(k:_Str_3870):void
        {
            var _local_2:_Str_5515 = (k._Str_2273() as _Str_5515);
            this._Str_17475 = _local_2._Str_23253;
            this._Str_3790 = _local_2._Str_8444;
            events.dispatchEvent(new SessionDataPreferencesEvent(this._Str_3790));
        }

        private function _Str_16302(k:_Str_5948):void
        {
            var _local_2:_Str_6831 = (k._Str_2273() as _Str_6831);
            this._Str_20255 = _local_2._Str_5738;
        }

        private function _Str_23236(k:IMessageEvent):void
        {
            var _local_3:IFurniDataListener;
            var _local_2:_Str_7162 = (k as _Str_9281)._Str_2273();
            if (_local_2 == null)
            {
                return;
            }
            this._Str_20692 = _local_2.isOpen;
            this._Str_20046 = _local_2._Str_22557;
            this._Str_8842 = _local_2._Str_11656;
            if ((((this._Str_11656) && (this._Str_20020)) && (!(this._Str_12845))))
            {
                this._Str_12845 = true;
                for each (_local_3 in this._Str_6042)
                {
                    _local_3._Str_15145();
                }
            }
        }

        private function _Str_18116(k:PetScratchFailedEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._Str_3973++;
        }

        private function _Str_18012(k:_Str_6160):void
        {
            var _local_2:_Str_5768 = k._Str_2273();
            this._Str_9602 = (_local_2.status == _Str_5768._Str_16052);
        }

        public function get _Str_25698():Boolean
        {
            return this._Str_20692;
        }

        public function get _Str_22031():Boolean
        {
            return this._Str_20046;
        }

        public function get _Str_11656():Boolean
        {
            if (((((false) || (false)) || (false)) || (false)))
            {
                return true;
            }
            return this._Str_8842;
        }

        public function hasSecurity(k:int):Boolean
        {
            return this._Str_8385 >= k;
        }

        public function get _Str_8500():int
        {
            return this._Str_16966;
        }

        public function get clubLevel():int
        {
            return this._clubLevel;
        }

        public function get _Str_14040():Boolean
        {
            return !(this._Str_7106 == _Str_10354._Str_13601);
        }

        public function get _Str_6986():Boolean
        {
            return this._Str_7106 == _Str_10354._Str_16717;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._name;
        }

        public function get realName():String
        {
            return this._realName;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get _Str_2799():Boolean
        {
            return this._Str_8385 >= SecurityLevelEnum._Str_3569;
        }

        public function get _Str_4050():Boolean
        {
            return this._Str_4890;
        }

        public function get _Str_22301():Boolean
        {
            return this._Str_20255;
        }

        public function _Str_21481(k:Boolean):void
        {
            this._Str_17475 = k;
        }

        public function get _Str_18110():Boolean
        {
            return this._Str_17475;
        }

        public function setFriendBarState(k:Boolean):void
        {
            this._Str_19986(UIFlags._Str_14290, k);
        }

        public function setRoomToolsState(k:Boolean):void
        {
            this._Str_19986(UIFlags._Str_13691, k);
        }

        public function get _Str_8444():int
        {
            return this._Str_3790;
        }

        private function _Str_19986(k:int, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                if ((this._Str_3790 & k))
                {
                    return;
                }
                this._Str_3790 = (this._Str_3790 | k);
            }
            else
            {
                if (!(this._Str_3790 & k))
                {
                    return;
                }
                this._Str_3790 = (this._Str_3790 & (~(k)));
            }
            this._communicationManager.connection.send(new _Str_9930(this._Str_3790));
        }

        public function _Str_18437(k:int):Array
        {
            return this._Str_7432._Str_24368(k);
        }

        public function getBadgeImage(k:String):BitmapData
        {
            return this._Str_4822.getBadgeImage(k);
        }

        public function _Str_20021(k:String):BitmapData
        {
            return this._Str_4822._Str_19714(k);
        }

        public function _Str_5831(k:String):String
        {
            return this._Str_4822._Str_5831(k);
        }

        public function _Str_19992(k:String):String
        {
            return this._Str_4822._Str_19435(k);
        }

        public function _Str_18459(k:String):BitmapData
        {
            return this._Str_4822.getBadgeImage(k, BadgeImageManager.NORMAL_BADGE, false);
        }

        public function _Str_15979(k:String):BadgeInfo
        {
            return this._Str_4822._Str_15979(k);
        }

        private function _Str_3168(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        public function _Str_17173(k:int):String
        {
            return this._Str_21127._Str_17775(k);
        }

        public function send(k:IMessageComposer):void
        {
            this._communicationManager.connection.send(k);
        }

        public function getGroupBadgeImage(k:String):BitmapData
        {
            return this._Str_4822.getBadgeImage(k, BadgeImageManager.GROUP_BADGE);
        }

        public function _Str_17218(k:String):BitmapData
        {
            return this._Str_4822._Str_19714(k, BadgeImageManager.GROUP_BADGE);
        }

        public function _Str_15583(k:String):String
        {
            return this._Str_4822._Str_5831(k, BadgeImageManager.GROUP_BADGE);
        }

        public function _Str_19687(k:String):String
        {
            return this._Str_4822._Str_19435(k, BadgeImageManager.GROUP_BADGE);
        }

        public function _Str_4701():Boolean
        {
            return this._Str_9602;
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communicationManager;
        }

        public function _Str_3655(k:String):Boolean
        {
            return this._Str_11263._Str_3655(k);
        }

        public function _Str_10249(k:String):void
        {
            this._Str_11263._Str_10249(k);
        }

        public function _Str_14353(k:String):void
        {
            this._Str_11263._Str_14353(k);
        }

        public function get _Str_3577():int
        {
            return this._Str_3437;
        }

        public function get _Str_2985():int
        {
            return this._Str_3973;
        }

        public function _Str_20136(k:int):void
        {
            if (((k >= 0) && (this._Str_3437 > 0)))
            {
                this.send(new _Str_10714(k));
                this._Str_3437 = (this._Str_3437 - 1);
            }
        }

        public function _Str_19464():void
        {
            this._Str_3437 = (this._Str_3437 + 1);
        }

        public function _Str_21665(k:int):void
        {
            if (((k >= 0) && (this._Str_3973 > 0)))
            {
                this.send(new _Str_8184(k));
                this._Str_3973 = (this._Str_3973 - 1);
            }
        }

        public function getProductData(k:String):IProductData
        {
            if (!this._Str_7186)
            {
                this.loadProductData();
            }
            return this._Str_2804[k];
        }

        public function _Str_3411(k:int):IFurnitureData
        {
            if (this._Str_3789 == null)
            {
                return null;
            }
            return this._Str_3789.getValue(k.toString());
        }

        public function _Str_19930(k:int):Array
        {
            var _local_3:IFurnitureData;
            var _local_2:Array = [];
            if (this._Str_3789 != null)
            {
                for each (_local_3 in this._Str_3789)
                {
                    if (_local_3.category == k)
                    {
                        _local_2.push(_local_3);
                    }
                }
            }
            return _local_2;
        }

        public function _Str_4531(k:int):IFurnitureData
        {
            if (this._Str_3347 == null)
            {
                return null;
            }
            return this._Str_3347.getValue(k.toString());
        }

        public function getFloorItemDataByName(k:String, _arg_2:int=0):IFurnitureData
        {
            var _local_4:int;
            if (this._Str_5556 == null)
            {
                return null;
            }
            var _local_3:Array = this._Str_5556.getValue(k);
            if (((!(_local_3 == null)) && (_arg_2 <= (_local_3.length - 1))))
            {
                _local_4 = _local_3[_arg_2];
                return this._Str_3411(_local_4);
            }
            return null;
        }

        public function _Str_14102(k:String, _arg_2:int=0):IFurnitureData
        {
            var _local_4:int;
            if (this._Str_5556 == null)
            {
                return null;
            }
            var _local_3:Array = this._Str_5556.getValue(k);
            if (((!(_local_3 == null)) && (_arg_2 <= (_local_3.length - 1))))
            {
                _local_4 = _local_3[_arg_2];
                return this._Str_4531(_local_4);
            }
            return null;
        }

        public function _Str_21275(userId:int, userName:String):void
        {
            var urlString:String;
            if (propertyExists("link.format.userpage"))
            {
                urlString = getProperty("link.format.userpage");
                urlString = urlString.replace("%ID%", String(userId));
                urlString = urlString.replace("%username%", userName);
                try
                {
                    HabboWebTools.navigateToURL(urlString, "habboMain");
                }
                catch(e:Error)
                {
                    Logger.log("Error occurred!");
                }
            }
        }

        public function _Str_21655(roomId:int):void
        {
            if (((this._roomSessionManager == null) || (this._windowManager == null)))
            {
                return;
            }
            var session:IRoomSession = this._roomSessionManager.getSession(roomId);
            if (session == null)
            {
                return;
            }
            if ((((session._Str_2781) || (this._Str_2799)) || (session.roomControllerLevel >= RoomControllerLevel.GUEST)))
            {
                this._windowManager.confirm("${generic.alert.title}", "${room.confirm.pick_all}", 0, function (k:_Str_2910, _arg_2:WindowEvent):void
                {
                    k.dispose();
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                    {
                        sendSpecialCommandMessage(":pickall");
                    }
                });
            }
        }

        public function _Str_21775(roomId:int, message:String):void
        {
            if (((this._roomSessionManager == null) || (this._windowManager == null)))
            {
                return;
            }
            var session:IRoomSession = this._roomSessionManager.getSession(roomId);
            if (session == null)
            {
                return;
            }
            if ((((session._Str_2781) || (this._Str_2799)) || (session.roomControllerLevel >= RoomControllerLevel.GUEST)))
            {
                this._windowManager.confirm("${generic.alert.title}", "${room.confirm.eject_all}", 0, function (k:_Str_2910, _arg_2:WindowEvent):void
                {
                    k.dispose();
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                    {
                        sendSpecialCommandMessage(message);
                    }
                });
            }
        }

        public function _Str_22197(k:int):void
        {
            if (((this._roomSessionManager == null) || (this._windowManager == null)))
            {
                return;
            }
            var _local_2:IRoomSession = this._roomSessionManager.getSession(k);
            if (_local_2 == null)
            {
                return;
            }
            if (((_local_2._Str_2781) || (this._Str_2799)))
            {
                this.sendSpecialCommandMessage(":ejectpets");
            }
        }

        public function _Str_21742(roomId:int):void
        {
            if (((this._roomSessionManager == null) || (this._windowManager == null)))
            {
                return;
            }
            var session:IRoomSession = this._roomSessionManager.getSession(roomId);
            if (session == null)
            {
                return;
            }
            if ((((session._Str_2781) || (this._Str_2799)) || (session.roomControllerLevel >= RoomControllerLevel.GUEST)))
            {
                this._windowManager.confirm("${generic.alert.title}", "${room.confirm.pick_all_bc}", 0, function (k:_Str_2910, _arg_2:WindowEvent):void
                {
                    k.dispose();
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                    {
                        sendSpecialCommandMessage(":pickallbc");
                    }
                });
            }
        }

        public function loadProductData(k:IProductDataListener=null):Boolean
        {
            if (this._Str_7186)
            {
                return true;
            }
            if (((k) && (this._Str_8233.indexOf(k) == -1)))
            {
                this._Str_8233.push(k);
            }
            return false;
        }

        public function _Str_16650(k:IProductDataListener):void
        {
            if (this._Str_7186)
            {
                k._Str_6674();
                return;
            }
            if (((k) && (this._Str_8233.indexOf(k) == -1)))
            {
                this._Str_8233.push(k);
            }
        }

        private function _Str_18413(k:Event):void
        {
            var _local_2:IProductDataListener;
            this._Str_5571.removeEventListener(ProductDataParser.PDP_PRODUCT_DATA_READY, this._Str_18413);
            this._Str_7186 = true;
            for each (_local_2 in this._Str_8233)
            {
                if (((!(_local_2 == null)) && (!(_local_2.disposed))))
                {
                    _local_2._Str_6674();
                }
            }
            this._Str_8233 = [];
        }

        private function _Str_5963(k:IMessageEvent):void
        {
            var _local_2:_Str_3407 = (k as _Str_3407);
            if ((((_local_2 == null) || (_local_2._Str_2273() == null)) || (k.connection == null)))
            {
                return;
            }
            var _local_3:_Str_5199 = _local_2._Str_2273();
            HabboWebTools.roomVisited(_local_3.roomId);
        }

        public function sendSpecialCommandMessage(k:String):void
        {
            this.send(new _Str_7738(k));
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._roomSessionManager;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get gender():String
        {
            return this._gender;
        }

        private function _Str_12366(k:IMessageEvent):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_2:_Str_5264 = (k as _Str_5264);
            if (_local_2._Str_12669 != null)
            {
                this._Str_8546 = _local_2._Str_12669;
            }
            if (_local_2._Str_17070)
            {
                this._Str_18167(null);
            }
            else
            {
                _local_3 = getInteger("catalogue.published.min.refresh.interval", 5);
                _local_4 = getInteger("catalogue.published.max.refresh.interval", 20);
                _local_5 = (Math.floor((Math.random() * ((_local_4 - _local_3) + 1))) + _local_3);
                if (this._Str_8108 == null)
                {
                    this._Str_8108 = new Timer((_local_5 * 3000));
                    this._Str_8108.addEventListener(TimerEvent.TIMER, this._Str_18167);
                    this._Str_8108.start();
                }
            }
        }

        private function _Str_18167(k:TimerEvent):void
        {
            if (this._Str_8108 != null)
            {
                this._Str_8108.removeEventListener(TimerEvent.TIMER, this._Str_18167);
                this._Str_8108 = null;
            }
            this._Str_3789 = new Map();
            this._Str_3347 = new Map();
            this._Str_5556 = new Map();
            this._Str_9650();
        }

        public function _Str_20401(k:IFurniDataListener):void
        {
            if (!this._Str_6042)
            {
                return;
            }
            var _local_2:int = this._Str_6042.indexOf(k);
            if (_local_2 > -1)
            {
                this._Str_6042.splice(_local_2, 1);
            }
        }

        public function _Str_4536(k:IFurniDataListener):Vector.<IFurnitureData>
        {
            if (((this._Str_3789 == null) || (this._Str_3789.length == 0)))
            {
                if (this._Str_6042.indexOf(k) == -1)
                {
                    this._Str_6042.push(k);
                }
                return null;
            }
            return Vector.<IFurnitureData>(this._Str_3789.getValues().concat(this._Str_3347.getValues()));
        }

        public function getXmlWindow(k:String):IWindow
        {
            var _local_3:IAsset;
            var _local_4:XmlAsset;
            var _local_2:IWindow;
            try
            {
                _local_3 = assets.getAssetByName(k);
                _local_4 = XmlAsset(_local_3);
                _local_2 = this._windowManager.buildFromXML(XML(_local_4.content));
            }
            catch(e:Error)
            {
            }
            return _local_2;
        }

        public function _Str_3122(k:String):BitmapData
        {
            var _local_2:String = k;
            var _local_3:IAsset = assets.getAssetByName(_local_2);
            var _local_4:BitmapDataAsset = BitmapDataAsset(_local_3);
            var _local_5:BitmapData = BitmapData(_local_4.content);
            var _local_6:BitmapData = new BitmapData(_local_5.width, _local_5.height, true, 0);
            _local_6.draw(_local_5);
            return _local_6;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localizationManager;
        }

        public function get _Str_11198():Boolean
        {
            return this._Str_7394;
        }

        public function get _Str_22295():Boolean
        {
            return (!(this._Str_6715 == null)) && (this._Str_6715._Str_992);
        }

        public function isPerkAllowed(k:String):Boolean
        {
            return this._Str_6715.isPerkAllowed(k);
        }

        public function _Str_15321(k:String):String
        {
            return this._Str_6715._Str_15321(k);
        }

        public function get currentTalentTrack():String
        {
            return ((getBoolean("talent.track.citizenship.enabled")) && (!(this.isPerkAllowed(PerkEnum.CITIZEN)))) ? TalentEnum.CITIZENSHIP : TalentEnum.HELPER;
        }

        public function get _Str_17491():String
        {
            return this._Str_18582;
        }

        public function get _Str_17927():String
        {
            return this._Str_18348;
        }
    }
}
